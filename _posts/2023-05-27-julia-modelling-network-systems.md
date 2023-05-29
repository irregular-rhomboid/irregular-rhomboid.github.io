---
layout: post
title: "Modeling dynamical systems on networks in Julia"
use_math: true
tags: [Julia Programming]
---

The Julia programming language currently holds the state of the art in terms of ODE solvers, and comes with a variety of ways of specifying ODEs. A common use case is to define modular dynamical systems, where the same pieces occur in multiple places with a bit of variation. Examples of this include running multiple copies of the same system with different parameters for each copy, or dynamical systems on networks like reaction-diffusion systems.

In this post, I'll cover three different ways of specifying such systems using various packages from the Julia ecosystem. In particular, I'll discuss how to do it using ModelingToolkit, which turns out to have some gotchas.

## Background: Reaction-Diffusion systems on networks

As the main example throughout this post, we'll be modelling generic reaction-diffusion systems on networks. Those are of the form

$$ \dot{u}_i = f(u_i) - D \sum_{j=1}^N A_{ij}g(u_i, u_j), $$

where $f$ is a function describing the local dynamics at node $i$ and $g$ is a function describing the pairwise dynamics on two nodes connected by an edge. The classical choice for $g$ is to take $g(u_i,u_j) = u_j - u_i$, which leads to the *Laplacian coupling* (also known as diffusion coupling). The parameter $D$ is a constant decribing the rate of diffusion.

For our demonstration, we will use the famous Brusselator model for the local dynamics. The equations for this model are given by

$$ \begin{align*} 
\dot{x} &= a + x^2 y - bx -x, \\
\dot{y} &= bx - x^2 y,
\end{align*} $$

where $a$ and $b$ are parameters of the model.

When using the Brusselator dynamics in a network reaction-diffusion model, we'll equip each node of a graph with variables $u_i$, $v_i$, subject to the equations

$$ \begin{align*}
\dot{u}_i &= a + u_i^2 v_i - b u_i - u_i + D_u \sum_{j=1}^N A_{ij}(u_j - u_i), \\
\dot{v}_i &= b u_i - u_i^2 v_i + D_v \sum_{j=1}^N A_{ij}(v_j - v_i).
\end{align*} $$

If we allow borrowing some notations from Julia, we can rewrite these in vector form as

$$ \begin{align*}
\dot{x} &= f_u.(u,v) - D_u L u,\\
\dot{v} &= f_v.(u,v) - D_v L v,
\end{align*} $$

where $f_u(x,y) = a + x^2 y - bx - x$, $f_v(x,y) = bx - x^2 y$, and the '.' indicates elementwise evaluation, or broadcast as it's known in Julia. The matrix $L$ is the *Laplacian matrix* $D-A$ of the graph, where $A$ is the adjacency matrix, and $D$ is a diagonal matrix whose entries correspond to the degrees of the graph's nodes ($D_{ii} = \sum_j A_{ij}$). This last form of the equations is the most concise, and the most handy for us as it involves operations we can easily express in Julia, namely broadcasting and matrix-vector multiplication.

## Approach 1: Manually defining the ODE function

The first method, which is the one I usually use, is simply to manually define the ODE function for my problem. Let's start by defining some functions for the brusselator dynamics, that will come in handy throughout this post.

```julia
brusselator_x(x,y,a,b) = a + x^2 * y - b*x -x
brusselator_y(x,y,a,b) = b*x - x^2 * y
```

Now the proper way to define dynamical systems in Julia this way is to use in-place function to avoid allocating memory. Let's do that now

```julia
function brusselator!(dx, x, p, t)
    # a, b = p
    du[1] = brusselator_x(x[1], x[2], p[1], p[2])
    du[2] = brusselator_y(x[1], x[2], p[1], p[2])
end
```

We can use this function to simulate the base Brusselator model, but we'd like to use it in a networked system. Now at that point we have to think about something. For our networked system, we need to stack $N$ copies of the basic system into a single array, but there are two ways we could do that: either as a $2 \times N$ array or a $N \times 2$ array. This is important because Julia stores array in Column-Major-Order, so it's always more efficient to do operations column-wise rather than row-wise. In this case, we expect the matrix multiplication to dominate the cost as $N$ gets large, so we'd like to have the inputs of our matmuls into columns. Therefore, using an $N \times 2$ array is the best choice in this case.

Let's write an in-place function for our reaction-diffusion system using the `brusselator!` function then. A simple implementation might look like

```julia
function brusselator_rd_1!(du, u, p, t)
    a, b, L, D = p
    for i in axes(du, 1)
        brusselator!(view(du, i,:), view(u, i,:), [a, b], t)
    end
    du[:,1] .-= D[1]*L*u[:,1]
    du[:,2] .-= D[2]*L*u[:,2]
end
```
which is decent enough, but the matrix-vector multiplication `L*u[:,1]` allocates memory, which we want to avoid. Let's replace it with the in-place [`mul!`](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/#LinearAlgebra.mul!) function.

```julia
function brusselator_rd_2!(du, u, p, t)
    a, b, L, D = p
    for i in axes(du, 1)
        brusselator!(view(du, i,:), view(u, i,:), [a, b], t)
    end
    mul!(view(du,:,1), L, view(u,:,1), -D[1], 0.0) # du[:,1] .-= D[1]*L*u[:,1]
    mul!(view(du,:,2), L, view(u,:,2), -D[2], 0.0)
end
```

Notice the use of `view` when calling in-place functions like `brusselator!` or `mul!`. This is important, as calling `view` creates a [view](https://docs.julialang.org/en/v1/base/arrays/#Views-(SubArrays-and-other-view-types)) of our array, which means `du` will correctly be updated by our in-place functions. This is not the case if we just index into the array with e.g. `u[:,1]`.

Having to write `view(...)` everywhere in our code gets tedious fast though, so luckily we can use the `@views` macro to make everything cleaner.

```julia
function brusselator_rd_3!(du, u, p, t)
    a, b, L, D = p
    @views for i in axes(du, 1)
        brusselator!(du[i,:], u[i,:], [a, b], t)
    end
    @views begin
        mul!(du[:,1], L, u[:,1], -D[1], 1.0) # du[:,1] .-= D[1]*L*u[:,1]
        mul!(du[:,2], L, u[:,2], -D[2], 1.0)
    end
end
```


## Approach 2: ModelingToolkit

The next approach uses the ModelingToolkit package to define our equations symbolically and then generate an optimized ODE function for it. For the base Brusselator system this looks like

```julia
@parameters t a b
@variables x(t) y(t)
D = Differential(t)

eqs_base = [
    D(x) ~ brusselator_x(x,y,a,b),
    D(y) ~ brusselator_y(x,y,a,b)
]

@named sys_base = ODESystem(eqs_base)
```

To build our networked system, the process is similar, except this time we need to use symbolic array variables

```julia
@parameters t a b L[1:N,1:N] D_u D_v
@variables u(t)[1:N] v(t)[1:N]
D = Differential(t)
```

We can create intermediate variables for the derivatives

```julia
dudt = brusselator_x.(u,v,a,b) - D_u * (L * u)
dvdt = brusselator_y.(u,v,a,b) - D_v * (L * v)
```
At this point, there are multiple ways to get the equations, starting with the most straightforward one

```julia
eqs_1 = [
    D.(u) ~ dudt;
    D.(v) ~ dvdt
]
```

which works, but won't render correctly in a Pluto Notebook. Notice the broadcast on the derivative. The equations will render correctly when passed to `ODESystem` though.

Whenever using symbolic arrays, it's useful to remember the function `Symbolics.scalarize` which converts a symbolic array into an array of symbolic scalar variables.

## Approach 3: NetworkDynamics

The last approach we'll explore in this post is using the NetworkDynamics package, which allows defining networked systems piece by piece, with possibly heterogeneous dynamics on the vertices, but also on the edges. It's powerful, but for such a simple system it needs more boilerplate than the other two methods.

We first need to define functions for the edges and vertices. For the edges, we are basically just writing the same function as in the beginning. This function gets called for each edge of the graph, is provided with the state of the edge, and the states of its endpoints

```julia
function rd_edge!(e, v_s, v_d, p, t)
    e .= v_s - v_d
    nothing
end
```

For the vertices, we have to define a function that gets called on each vertex to compute its dynamics from its current state and the states of its incident edges.

```julia
function rd_vertex!(dv, v, edges, p, t)
    a, b, L, D = p
    brusselator!(dv, v, [a,b], t)
    for e in edges
        dv .+= D .* e
    end
    nothing
end
```

Once we're done with that, all that's left is passing our functions to the appropriate types (Note that since only the vertices have dynamics, we use a `StaticEdge`), then passing those to the `network_dynamics` function, along with the graph we want to run the system on.

```julia
nd_rd_vertex = ODEVertex(; f=rd_vertex!, dim=2)
nd_rd_edge = StaticEdge(; f=rd_edge!, dim=2)

nd_rd = network_dynamics(nd_rd_vertex, nd_rd_edge, g)
```

## Conclusion
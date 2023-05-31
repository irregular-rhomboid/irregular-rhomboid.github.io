---
layout: post
title: "Modeling dynamical systems on networks in Julia"
use_math: true
tags: [Julia Programming]
---

The Julia programming language currently holds the state of the art in terms of ODE solvers, and comes with a variety of ways of specifying ODEs. A common use case is to define modular dynamical systems, where the same pieces occur in multiple places with a bit of variation. Examples of this include running multiple copies of the same system with different parameters for each copy, or dynamical systems on networks like reaction-diffusion systems.

In this post, I'll cover three different ways of specifying such systems using various packages from the Julia ecosystem. In particular, I'll discuss how to do it using ModelingToolkit, which turns out to have some gotchas.

All the code for this post can be found [here](). At the time of writing, I was using Julia 1.9.0 with DifferentialEquations v7.7.0, ModelingToolkit v8.56.0 and NetworkDynamics v0.8.1.

## Background: Reaction-Diffusion systems on networks

As the main example throughout this post, we'll be modeling generic reaction-diffusion systems on networks. Those are of the form

$$ \dot{u}_i = f(u_i) - D \sum_{j=1}^N A_{ij}g(u_i, u_j), $$

where $f$ is a function describing the local dynamics at node $i$, $A$ is the adjacency matrix of some graph and $g$ is a function describing the pairwise dynamics on two nodes connected by an edge. The classical choice for $g$ is to take $g(u_i,u_j) = u_j - u_i$, which leads to the *Laplacian coupling* (also known as diffusion coupling). The parameter $D$ is a constant decribing the rate of diffusion.

For our demonstration, we will use the famous [Brusselator](https://en.wikipedia.org/wiki/Brusselator) model for the local dynamics. The equations for this model are given by

$$ \begin{align*} 
\dot{x} &= a + x^2 y - bx -x, \\
\dot{y} &= bx - x^2 y,
\end{align*} $$

where $a$ and $b$ are parameters of the model.

When using the Brusselator dynamics in a network reaction-diffusion model, we'll equip each node $i$ of a graph with variables $u_i$, $v_i$, subject to the equations

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

Now, the proper way to define dynamical systems in Julia this way is to use in-place function to avoid allocating memory. Let's do that now

```julia
function brusselator!(dx, x, p, t)
    # a, b = p
    du[1] = brusselator_x(x[1], x[2], p[1], p[2])
    du[2] = brusselator_y(x[1], x[2], p[1], p[2])
end
```

We can use this function to simulate the base Brusselator model, but we'd like to use it in a networked system. Now, at that point we have to think about something. For our networked system, we need to stack $N$ copies of the basic system into a single array, but there are two ways we could do that: either as a $2 \times N$ or $N \times 2$ array. This is important because Julia stores array in Column-Major-Order, so it's always more efficient to do operations column-wise rather than row-wise. In this case, we expect the matrix multiplication to dominate the cost as $N$ gets large, so we'd like to have the inputs of our matmuls into columns. Therefore, using an $N \times 2$ array is the best choice in this case.

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
function brusselator_rd!(du, u, p, t)
    p_b, L, D = p
    @views for i in axes(du, 1)
        brusselator!(du[i,:], u[i,:], p_b, t)
    end
    @views begin
        mul!(du[:,1], L, u[:,1], -D[1], 1.0) # du[:,1] .-= D[1]*L*u[:,1]
        mul!(du[:,2], L, u[:,2], -D[2], 1.0)
    end
end
```

We can now use this function to define an ODE problem in the usual way

```julia
p = [[a_, b_], L_, [D_u_, D_v_]]
prob = ODEProblem(brusselator_rd!, u0, tspan, p)
sol = solve(prob, Rodas5()) # NB. This is a stiff system so we use Rodas5
``` 

A few comments before moving on to the next section. One advantage of this approach is that this function will work for any graph without needing to be recompiled. That will not be the case for the other two methods. Another benefit is that by using `mul!`, we can tune the exact type of `L` to get more performance. By default, it will be a sparse matrix, which is essentially needed for very large networks.

## Approach 2: ModelingToolkit

The next approach uses the [ModelingToolkit](https://docs.sciml.ai/ModelingToolkit/stable/) package to define our equations symbolically and then generate an optimized ODE function for it. For the base Brusselator system this looks like

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
eqs = [
    D.(u) ~ dudt;
    D.(v) ~ dvdt
]
```

which works, but won't render correctly in a Pluto Notebook. Notice the broadcast on the derivative. The equations will render correctly when passed to `ODESystem` though.

As a note, whenever using symbolic arrays, it's useful to remember the function `Symbolics.scalarize` which converts a symbolic array into an array of symbolic scalar variables. This can come in handy when trying to debug this kind of model definitions.

Let's finish this part by defining solving an `ODEProblem` for our system.

```julia
@named sys_rd = ODESystem(eqs)
p_mt = [
    a => a_,
    b => b_,
    collect(L .=> L_)...,
    D_u => D_u_,
    D_v => D_v_
]
u0_mt = [
    collect(u .=> u0[:,1]);
    collect(v .=> u0[:,2])
]
prob_mt = ODEProblem(sys_rd, u0_mt, tspan, p_mt)
sol_mt = solve(prob_mt, Rodas5())
```

Let us again comment a few things. One downside of this approach is the apparent need to use `(collect(L .=> L_))...` which adds every single entry of `L` individually in the parameters (I couldn't get to work otherwise). This leads me to expect that this approach won't be able to exploit the sparsity of `L`. Another problem is that it apparently just crashes for more than about 200 nodes with a stack overflow...

## Approach 3: NetworkDynamics

The last approach we'll explore in this post is using the [NetworkDynamics](https://pik-icone.github.io/NetworkDynamics.jl/dev/) package, which allows defining networked systems piece by piece, with possibly heterogeneous dynamics on the vertices, but also on the edges. It's powerful, but for such a simple system it needs more boilerplate than the other two methods.

We first need to define functions for the edges and vertices. For the edges, we are basically just writing the same function as in the beginning. This function gets called for each edge of the graph and is provided with the state of the edge, and the states of its endpoints

```julia
function rd_edge!(e, v_s, v_d, p, t)
    e .= v_s .- v_d
    nothing
end
```

For the vertices, we have to define a function that gets called on each vertex to compute its dynamics from its current state and the states of its incident edges.

```julia
function rd_vertex!(dv, v, edges, p, t)
    p_b, _, D = p
    brusselator!(dv, v, p_b, t)
    for e in edges
        dv .+= D .* e
    end
    nothing
end
```

Once we're done with that, all that's left is passing our functions to the appropriate types (Note that since only the vertices have dynamics, we use a `StaticEdge`), then passing those to the `network_dynamics` function, along with the graph we want to run the system on. Notice the use of `coupling = :antisymmetric` in the second call. This tells `NetworkDynamics` that our edge function is antisymmetric (the flow in one direction of the edge is the opposite of the flow in the other direction), which lets it use specific optimizations.

```julia
nd_rd_vertex = ODEVertex(; f=rd_vertex!, dim=2)
nd_rd_edge = StaticEdge(; f=rd_edge!, dim=2, coupling=:antisymmetric)

nd_rd! = network_dynamics(nd_rd_vertex, nd_rd_edge, g)
```
The result of the last line is just an `ODEFunction` that we can directly pass to `ODEProblem`

```julia
prob_nd = ODEProblem(nd_rd!, vec(u0), tspan, p)
sol_nd = solve(prob_nd, Rodas5())
```
Let's finish with some comments before moving to the last part. Due to the way the package is designed, the generated ODE function will always exploit the sparsity of the graph, as it is specifically tailored to it. This comes at the cost of boilerplate which is a bit much in our case.

## Benchmarks

Being to easily define systems is well and good, but ultimately we also care about how fast the generated code is. For that purpose, I benchmarked the generated ODE functions for all three methods on a network with 5 nodes (see the notebook for details).

As we can see on the figure below, ModelingToolkit seems to be the fastest, with our hand-crafted solution close by, and NetworkDynamics being more than an order of magnitude slower.

![A boxplot comparing the speed of the three approaches](/assets/img/julia-network-systems/boxplot.png)

Now, this one test is obviously not conclusive enough. In particular, we need to look at what happens with larger systems. In the next figure, I repeated the previous benchmarks for multiple network sizes, and I'm plotting the median execution times of the ODE functions as a function of the number of nodes. I'm also comparing the hand-crafted function when using a sparse/dense matrix for the graph Laplacian.

As we can see, both hand-crafted variants are about even, as we aren't in the regime where the sparse matmul will beat the dense one. ModelingToolkit is the most performant for low values, but catches up with the hand-crafted functions at $N=100$ nodes (after which it just errors as mentioned at the end of section 2). NetworkDynamics on the other hand is consistently slower than the other methods by three order of magnitudes, taking on the order of a second for $N=1000$ nodes (ouch!).

![A plot of the median run times of the three approaches](/assets/img/julia-network-systems/benchmarks.svg)

Based on these observations, I'd stick with the hand-crafted method for most problems, using sparse matrices for large networks to save on memory. It would be nice if I found a way to work with ModelingToolkit for this, as it has the great advantage of being able to generate ODE functions that can run in parallel or on GPUs, which the hand-crafted functions can't as they are. As for NetworkDynamics, well it seems it has room for improvement...

## Conclusion

Let's summarize what we discussed in this post

- When hand-crafting ODE functions, `@views` is your friend. So is `mul!`. It can be difficult to get rid of all the allocations in some cases, though.
- ModelingToolkit is pretty good, but doesn't seem to handle large matrices of parameters well, but maybe I'm using it wrong. When debugging, `scalarize` is your friend.
- NetworkDynamics adds a bit of boilerplate, for seemingly lackluster performance. Admittedly it's designed with heterogeneous systems like power networks in mind, but it seems like ModelingToolkit could do that job better.

## Appendix

I've kept a bunch of experimental details out of this post. In particular, I didn't say anything about the memory allocations, which actually follow a similar pattern as the execution times. See the code for more.

I tried as much as reasonably possible to write optimized code for all methods. One thing I didn't do is use `Base.@propagate_inbounds` in the NetworkDynamics code which is done in [their examples](https://pik-icone.github.io/NetworkDynamics.jl/dev/directed_and_weighted_graphs/). I tried it during writing and found I didn't make a noticeable difference. 

Another thing I didn't use here, but tried and failed to get working a while ago is using [Split ODEs](https://docs.sciml.ai/DiffEqDocs/stable/types/split_ode_types/) to separate between the local nonlinear dynamics and the linear coupling dynamics. I don't expect this to affect the ODE function performance in this case.
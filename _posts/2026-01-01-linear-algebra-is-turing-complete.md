---
layout: post
title: "Linear Algebra is (almost) Turing Complete"
use_math: true
tags: [Math, Functional Analysis, Computation, Dynamical Systems]
---

Turing Machines are the classic formalization of computation, later followed by many others. In this post, I will show how to represent any Turing Machine as a nonlinear operator on an appropriate Banach space. Along the way, we'll find interesting interpretations of things like the Halting Problem as well as ~~connections to a cool part of Dynamical Systems theory~~[^cursed].

[^cursed]: This turned out to be extremely cursed, and was consequently scrapped.

Note: While I try to provide intuitions for the things I do, I assume at least that the reader is familiar with basic linear algebra. However, this post discusses some intuitions I have which are hard to express (and indeed are not completely deconfused for me), so your mileage may vary.

I started writing this post a few years ago, and kept not knowing what to do with it, which might explain it's uneven pace, and not too pleasant notation. 

## Turing Machines

Let's start by defining Turing Machines. The original definition in Turing's seminal paper goes something like this. We have an infinite roll of tape with slots containing symbols, along with a device with a reading head that looks at a specific slot on the tape, and based on its internal rules, writes a new symbol in the slot, and moves the tape exactly one slot left or right. [More formally](https://en.wikipedia.org/wiki/Turing_machine#Formal_definition), a Turing Machine is characterized by

* A finite non-empty set of *tape-symbols* $\Gamma$, which usually includes a special *blank symbol* $b$,
* A set $$\Sigma \subset \Gamma \setminus \lbrace b\rbrace $$ of *input symbols*,
* A finite non-empty set of *machine states* $Q$,
* An *initial state* $q_0 \in Q$,
* A set $F \subseteq Q$ of *terminating states*, which is usually just a singleton $$\lbrace HALT \rbrace,$$
* A partial *transition function* $\delta: (Q\setminus F)\times \Gamma \rightarrow Q \times \Gamma \times \lbrace L,R\rbrace,$ that takes as input a machine state and a tape-symbol, and returns the new internal state of the machine, the new symbol to write on the tape, and which direction to move the tape.

In order to make our lives easier, we will slightly modify this definition, in a way that won't change its fundamental properties. In particular, the transition function, which is really the meat of the Turing Machine, is not defined everywhere, which won't translate nicely to the Banach space setting, so we'd like to extend it in a natural way, such that the behavior of the machine is defined when it has reached a terminating state.

The simplest way to do that is to make the transition function the identity function once the machine reaches a terminating state. But we also need to leave the tape unchanged, so let's add a "no-op" symbol $N$ to the set of tape movements, which just means that the tape stays in place. This doesn't change the computational power of the machine, and will come in very handy later.

Before moving to the next section, let's talk about another common way to specify Turing Machines. As we can see, the transition function is what's doing the heavy lifting in this definition, with the rest being setup. Since it's a function defined on a finite set, we can completely characterize it by a table of all its input-ouput pairs. As an example, we'll take the table of the 3-state busy beaver from the wikipedia page on Turing Machines.

| **Machine State** | **Tape Symbol** || **New State** | **Write Symbol** | **Move** |
| A | 0 || B | 1 | R |
| A | 1 || C | 1 | L |
| B | 0 || A | 1 | L |
| B | 1 || B | 1 | R |
| C | 0 || B | 1 | L |
| C | 1 || HALT | 1 | R |

Of course, we need to extend this according to our modifications, which just means adding these two rows to the table

| HALT | 0 || HALT | 0 | N |
| HALT | 1 || HALT | 1 | N |


## Into Banach Spaces
In order to translate our Turing Machine into the language of Functional Analysis, we'll first have to translate its parts. Luckily, this is fairly straightforward. We can just map the sets $\Gamma$ and $Q$ to vector spaces! Now, since we want to express the action of the Turing Machine as a linear operator, and the Turing machine fundamentally manipulates symbols, we need to map these symbols to their equivalents for linear operators.

What do linear operators fundamentally operate on? Well, you may recall that if you take a linear operator, and equip its input and output spaces with bases, you can completely characterize the operator by taking each input basis element, applying the operator to it and look at how the result is expressed in the output basis (In other words, we're looking at the *matrix representation* of the operator, with respect to the input and output bases). This lets us translate the mapping of symbol to symbol as a mapping of basis element to basis element. Just what we need!

So let us take a finite dimensional vector space of dimension $\vert\Gamma\vert$ (respectively $\vert Q\vert$), along with a basis (for instance, $\mathbb{R}^{\vert\Gamma\vert}$ with its canonical basis) and simply map the symbols from $\Gamma$ to the basis elements. To put this more concretely, let $\lbrace e_\gamma\rbrace_{\gamma\in\Gamma}$ and $\lbrace\epsilon_q\rbrace_{q\in Q}$ be the canonical bases of $\mathbb{R}^{\vert\Gamma\vert}$ and $\mathbb{R}^{\vert Q\vert}$, and simply bijectively map each tape-symbol $\gamma\in \Gamma$ to some basis element $e_\gamma$, and each machine state $q\in Q$ to some corresponding $\epsilon_q$.

Now that we have the symbols covered, let's move on to representing the tape itself. Back in the Turing Machine setting, the tape is supposed to be this infinite roll of paper with slots for symbols that can be winded arbitrarily far to the left or right. It turns out that we have a natural way to represent this in functional analysis, namely *two-sided infinite sequences*. Formally, the tape is an object of the form

$$ (\dots, t_{-2}, t_{-1}, t_0, t_1, t_2, \dots) = (t_n)_{n\in \mathbb{Z}} \subset \mathbb{R}^{\vert\Gamma\vert}, $$

where $t_0$ is the slot under the reading head.

Now we're entering into [*Banach space*](https://en.wikipedia.org/wiki/Banach_space) territory proper, so let's name the space where those objects live. Due to the way we're representing the tape-symbols, the simplest such space is $T = \ell^\infty (\mathbb{Z},\mathbb{R}^{\vert\Gamma\vert})$, that is the *space of bounded two-sided infinite sequences in* $\mathbb{R}^{\vert\Gamma\vert}$. We also define $M = \mathbb{R}^{\vert Q\vert}$ as a shorthand.
Let's wrap this part up by defining the space where the complete state of our Turing machine resides. The machine at a given point in time is completely characterized by its machine state and tape-state, so the straightforward way to translate this into the language of functional analysis is to take the [*direct sum*](https://en.wikipedia.org/wiki/Direct_sum) of our representations of the machine states and tape-states. In other words, our state space is

$$ X = M \oplus T, $$

whose elements look like $(m,t) \in M \times T$ with vector space operations defined coordinate wise.

A canonical "basis"[^basis] of $X$ is given by

$$ \lbrace (\epsilon_q,0) \rbrace_{q\in Q} \cup \lbrace (0,\tau_{k,\gamma}) |\, k\in \mathbb{Z}, \gamma \in \Gamma \rbrace, $$

where $\tau_{k,\gamma}$ is the sequence in $\ell^\infty(\mathbb{Z},\mathbb{R}^{\vert \Gamma \vert})$ whose every element is zero except for the $k$-th one which is equal to $e_\gamma$.

[^basis]: strictly speaking it is not a basis in any proper sense. Look up Schauder and Hamel bases if you're curious.

Let's finish this section by equipping $X$ with the following [*supremum norm*](https://en.wikipedia.org/wiki/Uniform_norm) to get a Banach space:

$$ \lVert (m,t)\rVert_{X,\infty} = \max \lbrace \lVert m \rVert_M, \sup_{k\in\mathbb{Z}} \lVert t_{k} \rVert_\Gamma \rbrace, $$

where $\lVert~.~ \rVert_M$ and $\lVert~.~\rVert_\Gamma$ are norms on their respective spaces. We actually have a lot of leeway when choosing those, since all norms are equivalent on finite dimensional spaces (in the sense that they induce the same topology).

This choice of norm, while somewhat arbitrary, has the consequence that any valid state of our Turing machine has unit norm, that is, our states still live in the *unit sphere* $\mathcal{S}_X(0,1)$ of $X$[^unitball]. This isn't essential, but we'll do it that way for cleanliness' sake.


[^unitball]: We'll see later that this has qabbalistic implications.


## The Transition Operator

Now that we've expressed the state of our Turing machine as an element in a Banach space, we can get started with the meaty bit, namely, representing the transition function $\delta$ by an operator on $X$, which we'll call $\delta_X:X\rightarrow L(X)$, which takes the current state of the Turing machine, and returns a linear operator over $X$ that when applied to the current state, yields the next state. For $(m,t)\in X$, $\delta_X(m,t)$ takes the form

$$ \delta_X(m,t) = \tilde{\delta}(m \otimes \pi_0(t)), $$

where $\pi_0:T\rightarrow \mathbb{R}^{\vert\Gamma \vert}; t \mapsto t_0$ is the linear operator that returns the $0$-th element of the tape. This corresponds to reading the tape-symbol under the reading head. The operator $\tilde{\delta}: M \otimes \mathbb{R}^{\vert \Gamma \vert} \rightarrow L(X)$ acts on the [*tensor product*](https://en.wikipedia.org/wiki/Tensor_product)[^quantum] of $M$ and $\mathbb{R}^{\vert \Gamma \vert}$. Given two finite dimensional vector spaces $U$ and $V$, with bases $$\lbrace u_i\rbrace_{i\in I}$$ and $$\lbrace v_j\rbrace_{j\in J}$$, a basis of $U \otimes V$ can be obtained with

$$ \left\lbrace u_i \otimes v_j | i\in I, j\in J \right\rbrace, $$

Intuitively, $U \otimes V$ is isomorphic to the space of linear maps from $V$ to $U$, with the basis elements $u_i \otimes v_j$ forming the canonical matrix basis induced by the bases on $U$ and $V$[^matrix-basis]. Why do this? Simply put, we'd like to work as much as possible with linear operators, but in order to encode every row of the table, we need a basis vector for every possible combination of $m$ and $x$. Taking the outer product is a bilinear operation (in that it is linear in $m$ and $x$ separately) that produces just that, and so we can now express the table using a linear map acting on $M \times \mathbb{R}^{\vert \Gamma \vert}$.

[^quantum]: Readers familiar with quantum theory may see where this is going. See also: [^unitball].

[^matrix-basis]: That is, $u_i \otimes v_j$ is isomorphic to the matrix with all zero elements, except element $ij$ which is one. Instead of a matrix, we can also think of it as a 2D array, without any algebraic structure.

Remember that we previously chose to use basis elements to represent our symbols, because this was the natural way to work with linear operators? Well it's time to make use of that. A linear operator on a vector space can be completely characterized by how it acts on basis vectors. This means we can directly translate the table we showed in the first section. Let's do this for the first row of the table.

| A | 0 || B | 1 | R |

Recall that it means that when the machine state is A and the currently read tape-symbol is 0, then the machine writes 1 to the current slot, shifts the tape one slot to the right and switches its machine state to B. This can be translated as

$$ \tilde{\delta}(\epsilon_A \otimes e_0) = P_A^B \oplus (S^1 \circ D_0^1), $$

where $P_A^B: M \rightarrow M$ is the linear operator that maps $\epsilon_A$ to $\epsilon_B$ and leaves any other basis vector unchanged. The operator $D_0^1 \in L(T)$ corresponds to writing to the 0 slot of the tape, and leaving every other slot unchanged, that is,

$$ D_0^1 \tau_{k,\gamma} = \begin{cases}
\tau_{k,\gamma}, & k \neq 0, \\
\tau_{k,1} & k = 0 \text{ and } \gamma = 0, \\
\tau_{k,1} & k = 0 \text{ and } \gamma = 1
\end{cases}
$$

Another way to write it would be

$$ D_0^1 (\dots, t_{-1}, t_0, t_1, \dots) = (\dots, t_{-1}, P_0^1 t_0, t_1, \dots). $$

Finally, the operator $S^1\in L(T)$ is simply the *right-shift operator*, which as the name suggest, moves the tape one slot to the right,

$$ S^1 ((t_n)_{n\in\mathbb{Z}}) = (t_{n-1})_{n\in\mathbb{Z}}. $$

Along, with $S^1$, we can also define its cousins the *left-shift operator* $S^{-1}$ and the *no-shift operator* (aka the identity) $S^0 = Id$.

Putting things together, we have

$$ [\delta_X(m,t)](m,t) =  \big(P_A^B \oplus (S^1 \circ D_0^1)\big)(m,t) = (P_A^B m, S^1 D_0^1 t). $$

From this example, it should be clear that for any line of our table, we can construct a corresponding linear operator on $X$, so that $\tilde{\delta}$ is well-defined (and linear while we're at it!).

After doing all this, we'll be left with a map that expresses a single iteration of the Turing machine. It's probably good to reiterate what it does. Given some state $(q,t)$ we first take the zero-th element $t_0$ of the tape state, and take its tensor product $q \otimes t_0$ with the machine state (this is a bilinear map). We then map this linearly to an appropriate operator in $L(X)$, which in this case is just a pair of maps $M \rightarrow M$ and $T \rightarrow T$. This is a nonlinear map, because when taking the outer product, we are multiplying coefficients of $m$ and $t_0$ (so we may think of the outer product as a "quadratic" operation), and applying the resulting operator to $(m,t)$ adds another "multiplication", so we may think of the whole mapping as a "cubic" operation.

Let us also note an important property of the transition operator $\delta_X$, which is that it is norm preserving. This is because all the operations $$P^{q'}_q$$, $$D^{\gamma'}_\gamma$$ just map basis vectors to basis vectors, and the shifts obviously don't change the norm either. This means in particular, that a state embedded into the unit ball will stay in the unit ball when applying the transition map.

## The Halting Problem

Now that we've completely ported Turing Machines to the language of linear algebra, we can ask what fundamental questions from computability theory look like in this language. In particular, let us look at the *Halting Problem*, i.e. whether a given machine presented with a certain input will reach the halting state after a finite number of transitions. This problem is famously *undecidable*, in the sense that it cannot be solved using a Turing Machine.

In our linear algebraic setting, the operation of the machine can be framed as a nonlinear discrete-time dynamical system. Due to the way we modified the definition of Turing machines at the beginning of this post, once the machine reaches the halting state, it just stays in the same state forever. In the language of dynamical systems, this is called a *fixed point*.

The Halting problem then translates to whether the dynamical system we obtained will reach a fix point. As one might expect, this is also undecidable. It's worth thinking about why stepping to the language of dynamical systems doesn't really help us here. Usually, when studying a discrete-time dynamical system such as this one, the first step is to identify any fixed points. In the case of our Turing machines, any state $(m,t)$ such that $m$ is the halting state is a fixed point, so we have infinitely many fixed points, most of which are spurious.

So identifying *which* fixed points we care about is already nontrivial, but on top of that, it is not straightforward at all to apply the standard stability analysis tools from finite dimensional spaces. In finite dimensions, we would compute the *Jacobian* of the dynamics at the fixed point and compute its spectrum. If all eigenvalues are less than one in magnitude, then the fixed point is stable. In infinite dimensions, computing the equivalent of the Jacobian is highly nontrivial, as there are [multiple definitions of functional derivatives](https://en.wikipedia.org/wiki/Functional_derivative), which depend on the actual topology we have on the space. Even if we did compute the derivative, computing spectra of linear operators in infinite dimensional spaces is a *lot more cursed*, as the spectrum may be uncountable, or contain no eigenvalues, meaning the stability criterion from finite dimensions no longer applies so easily[^stability].

[^stability]: In fact, this is why there entire fields of researchers studying infinite-dimensional stability analysis of PDEs.

If you have studied topology, you might hope to use the fact that state live in the unit sphere with some compactness argument. Unfortunately, the unit sphere in infinite-dimensional normed spaces is not compact.

## Linear combinations

So far we've talked about embedding our "discrete" Turing machines into vector spaces, but with that mapping also comes the ability to take arbitrarily linear combinations of machine states. A natural interpretation for these would be as "probability densities" over machine states (doing this properly would require adjusting the norms in our definition of the space $X$). Everything in our previous construction would still work fine. In most cases however, I would expect the probability mass to just spread out which wouldn't be especially informative.

We can also implement a form of [nondeterministic Turing machines](https://en.wikipedia.org/wiki/Nondeterministic_Turing_machine), by encoding the multiple choices in the $\delta_X$ map. Once again, if weights are normalized properly, we can naturally interpret this as probabilistic Turing machines, and the dynamical system would describe the evolution of the probability distribution of machine states.

## Comparison with Transformers

The way we have implemented Turing machines bears similarities to the Attention mechanism used in Transformers. To see this, let's think back on how we defined the transition operator as a map $X \rightarrow L(X)$. In general, such a map can be decomposed into two maps, $M \times T \rightarrow M$ and $M \times T \rightarrow T$. While the latter space is too large to be nicely described, we can look at a smaller class of maps by abstracting away the details of $\delta_X$. 

We defined $\delta_X$ as a map $\tilde{\delta}$ applied to the outer product $m \otimes t_0$. We can think of $m$ and $t_0$ as projections from $X$ to finite-dimensional spaces, and a natural way to abstract it would be to replace $m$ with some $q = W_q x$ and $t_0$ by $k = W_k x$, have the linear map applied to $x$ be of the form $\tilde{\delta}(q \otimes k)$, or perhaps $W_v \circ \tilde{\delta}(q \otimes k)$, where $W_v \in L(X)$.

At this point you may see where I'm going, given the not so subtle choice of naming. What I described in the previous paragraph looks a lot like the attention mechanism, though this is in part due to a notation trick. The standard definition of (self) attention as a sequence transformation taking as input a sequence $x \in \mathbb{R}^{L \times d}$ of length $L$ and token dimension $d$, is as

$$ \mathcal{A}(X) = \operatorname{softmax} \left( \frac{q k^T}{\sqrt{d_k}} \right) v W_o, $$

where $q = x W_q$, $k = x W_k$ and $v = x W_v$, with $W_q, W_k, W_v \in \mathbb{R}^{d \times d_k}$ and $W_o \in \mathbb{R}^{d_k \times d}$. Compared to the notation above, everything is transposed, which is why we're multiplying $x$ on the right. Ignoring the practical details like the softmax and normalization factor, the basic structure is the same. A similar structure can be found for alternative sequence modeling architectures such as State-Space Models.

## Terminating state(ment)

I think this post has drawn on for long enough, so lets conclude. The main takeaway is that some relatively simple linear algebra (and some not so simple functional analysis) lets us cast Turing machines in a mathematically convenient language, and that by squinting a bit, the attention mechanism is more or less a generalization of Turing machines with finite tape. This isn't really a serious argument, though since a lot more engineering is needed to make transformers work, and we wouldn't expect Transformers to learn the kind of sparse circuits we derived for Turing Machines. It might be that the "learn a map $X \rightarrow L(X)$" thing has legs for deriving novel architectures, but that is outside the scope of this post.


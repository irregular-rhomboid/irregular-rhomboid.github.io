# Graph coarsening

The purpose of this note is to elaborate a concrete example of what I *think* might be an instance of "renormalization". Renormalization is a concept from physics I regularly run into (read: hear the word thrown around), but as a mathematician, I have yet to find a satisfying (e.g. axiomatic) explanation of what it's supposed to be.

## Prelude: Epidemic spreading on networks

The main object that will serve as the central example in what follows is epidemic spreading on networks, or more precisely, its various mean-field approximations. In broad strokes, we have a population of individuals through which some infectious disease is spreading. To model the spread of the disease through time, we assume that each individual in the population is in one of finitely many states (called *compartments*) that approximate the stages of the disease. For example, the classical SIR model has states Susceptible (not yet infected), Infected (carries the disease and is infectious) and Recovered (has developed immunity and is no longer infectious). 

In addition to these epidemic states, we also model transitions between them. In the SIR case, an infected individual can transmit the disease to a susceptible individual, which eventually causes said susceptible individual to transition to the infected state. An infected individual can also spontaneously become Recovered.

### Homogeneous mean-field (HMF)

How to translate this into equations requires some additional assumptions on the population. For example, the seminal paper introducing the SIR model, the authors assumed that the population is "homogeneously mixed", meaning that any infected individual has the same probability of transmitting disease to any susceptible individual. In practice, this means that we can think of the various compartments as chemical species $S$, $I$, $R$ homogeneously mixed in a fixed volume, with the epidemic transitions being modelled as chemical reactions. Specifically,

$$
\begin{align*}
S + I &\stackrel{\beta}{\longrightarrow} 2I,\\
I &\stackrel{\gamma}{\longrightarrow} R.
\end{align*}$$

This set of chemical reactions can in turn be interpreted as a stochastic dynamical system that can be simulated using the Gillespie algorithm, or directly turned into differential equations using the law of mass action, which yields

$$\begin{align*} 
\dot{S} &= -\beta SI,\\
\dot{I} &= \beta SI - \gamma I,\\
\dot{R} &= \gamma I.
\end{align*}$$

The above equations are recognizable to anyone who learned about epidemic modelling, and are known as the *homogeneous meanfield approximation* of the SIR model. It's only an approximation because the "true" model would be the stochastic one, which is a continuous-time Markov chain with $3^N$ states, where $N$ is the size of the population. In theory, we could get an exact ODE from the stochastic model, but the exponential size of the system makes this impractical, which is why we use approximation like above in practice (the HMF is describes the expected value of the stochastic system). All such approximations can be derived by assuming that certain quantities are independent at all times, which is wrong, but works well in practice with large populations.

One the main questions of interest in epidemic modelling is predicting whether a disease is going to spread to the whole population or die out. This can be translated into whether the disease-free state $(N,0,0)$ is stable under the dynamics. Computing the Jacobian of the dynamics around this point quickly reveals a single decoupled linear equation for $I$,

$$ \dot{I} \approx (\beta N - \gamma) I, $$

which is unstable if $\beta N - \gamma > 0$, or after some trivial manipulations, 

$$ \frac{\beta}{\gamma} > \frac{1}{N}. $$

This last equation is known as the epidemic threshold equation, and gives an (approximate) condition for when the disease risks spreading to the entire population. In practice, the dependence on $N$ here is annoying and we typically get rid of rid by rescaling $\beta$ by $1/N$ so that the epidemic threshold becomes $\beta/\gamma > 1$. One issue with that for our purposes is that the $\beta$ parameters from the HMF and IBMF models have different meaning. I prefer to stick to interpreting $\beta$ as the *transmission rate*, i.e. the rate at which the disease gets transmitted from an infected individual to a susceptible individual through a single contact, which is the interpretation from the IBMF model. This is ultimately a choice of scaling, so it's not essential.

### Individual-based mean-field (IBMF)

Of all the assumptions made so far, the most unreasonable one is that the population is homogeneously mixed. Diseases such as COVID spread through social contacts, and thus an infected individual is more likely to transmit the disease to their friends and family members than to someone living in the next town over. We can model this social structure by using some graph $G=(V,E)$ where each vertex represent an individual, and an edge $ij \in E$ represents a social connection between vertices $i$ and $j$. If we make the somewhat extreme assumption that infection only gets transmitted via edges and that the rate of transmission is the same for everyone, we can again model the system as a set of chemical equations

$$\begin{align*} 
S_i + I_j &\stackrel{\beta}{\longrightarrow} I_i + I_j,~~ \forall ij \in E,\\
I_i &\stackrel{\gamma}{\longrightarrow} R_i,~~ \forall i \in V.
\end{align*}$$

The compartments $S_i$, $I_i$, $R_i$ now represent the state of individual $i$, and it is appropriate to think of the "concentration" of these compartments as the probability that $i$ is in a given state. The mean-field equations for this model are given by

$$\begin{align*} 
\dot{S}_i &= -\beta S_i \sum_{j\in V} A_{ij} I_j,\\
\dot{I}_i &= \beta S_i \sum_{j\in V} A_{ij} I_j - \gamma I_i,\\
\dot{R}_i &= \gamma I_i, 
\end{align*}$$

with $A = [A_{ij}]$ the adjacency matrix of $G$. These equations are known as the *individual based mean-field* model. We can compute the epidemic threshold for this model. The disease-free state is the one where $S_i = 1$ for all $i$, all other variables being zero, and the linearized equation for $\mathcal{I} = [I_1, \dots, I_N]$ is given by

$$ \mathcal{I} = (\beta A - \gamma I) \mathcal{I}, $$

where here, $I$ denotes the identity matrix. This system is unstable if at least one eigenvalue of $A$ is larger than $\gamma$, which we can conveniently express using the spectral radius $\rho(A)$ as $\beta \rho(A) - \gamma > 0$, or after some manipulations,

$$ \frac{\beta}{\gamma} > \frac{1}{\rho(A)}. $$

There are many other ways to further refine or approximate the above two models. What I'll try to do in the rest of this note is the sketch a framework that includes many of them in a principled way that looks like we're doing some form of renormalization.

### From IBMF to HMF

Given the interpretation of the homogeneous mean-field model, we should expect it to be roughly equivalent to the individual-based mean-field when the underlying graph is the complete graph. We will now derive this. We can write the adjacency matrix of the complete graph as $A_{ij} = 1 - \delta_{ij}$, where $\delta_{ij}$ denotes the Kronecker delta. Plugging this into the IBMF equations, and letting $S = \sum_i S_i$, $I = \sum_i I_i$, $R = \sum_i R_i$, we obtain,

$$\begin{align*} 
\dot{S} &= \sum_i \dot{S}_i = -\beta \left(\sum_i S_i \right) \sum_j (1-\delta_{ij}) I_j = -\beta SI + \beta\sum_{i} S_i I_i\\
&\approx -\beta SI,
\end{align*}$$

with the other equations being straightforward. The error term $\sum_i S_i I_i$ is negligible as $N$ becomes large, so we may ignore it.

We can actually adapt this to obtain a reasonable approximation of the IBMF by a HMF under certain conditions. Suppose that $I_i$ is approximately equal $I/N$ for all $i$, then we may write

$$\begin{align*}
\dot{S} &\approx -\beta \sum_i S_i \sum_j A_{ij} I/N = -\beta \sum_i   \frac{k_i}{N} S_i I\\
 &\approx -\beta \frac{\langle k \rangle}{N} S I,
\end{align*}$$

where $k_i = \sum_j A_{ij}$ and $\langle k \rangle = \frac{1}{N} \sum_i k_i$ are the degrees and average degree, respectively. In the last equation, we assumed that the degrees are tightly clustered around their mean value. While all these assumptions seem a bit contrived, the resulting "parameter transfer" obtained by scaling $\beta$ by $\langle k \rangle / N$ does work reasonably well for Erdos-Rényi graphs or random regular graphs. One of the things we will try to achieve below is generalizing this kind of parameter transfer.

## Partitions of a finite set

We will build up the framework mentionned just before from the bottom up, starting with a principled way to "coarse-grain" a graph and associated data on it. Morally, coarse-graining involves taking a set of data, grouping them together according to some rule and aggregating the data within each group. A natural way to separate a set of data is to partition it. It is therefore a good idea to consider the set of all possible ways to partition a set, and look at the structure this might have.

Given a finite set $V = \{1,\dots, N\}$ (which we'll later think of as the set of vertices in a graph), we write the sets of partitions of $V$ as $\Pi(V)$. The set $\Pi(V)$ can be equipped with a partial order given by $P \le Q$, for $P = \{P_1,\dots,P_n\}$, $Q = \{Q_1,\dots,Q_m\}$, if every element of $P$ is a subset of an element of $Q$. We say that $P$ is finer than $Q$, or that $P$ is a *refinement* of $Q$. It is easy to see that $\{\{v\}~|~v \in V \}$ is the unique minimal element of $P(V)$ and $\{V\}$ is the unique maximal element. On top of that, for any two $P,Q \in \Pi(V)$, there is a unique *least upper bound* (also known as *join*) $P \vee Q$ and a unique *greatest lower bound* (also known as *meet*) $P \wedge Q$, which gives $\Pi(V)$ the structure of a *bounded lattice*.

We can restate the above in terms of categories. The set of partitions $\Pi(V)$ is a (poset) category with initial object $0 = \{\{v\}~|~v \in V \}$, terminal object $1 = \{V\}$, with finite products (meets) and coproducts (joins).

## Coarse-graining of finite graphs

Suppose we have some graph $G = (V,E)$ that we would like to coarse-grain. It seems natural to aggregate vertices using partitions, but we also need to preserve information about the "size" of these partitions. We can do this by lifting our graph to a weighted graph. Given some partition $\pi \in \Pi(V)$, the *coarse-grained graph*ws $G/\pi$ is the weighted graph $(\pi, E_\pi, w_\pi, w_{E_\pi})$, with vertex set $\pi$, with an edge $uv \in E_\pi$ if there exist vertices $i \in u, j \in v$ such that $ij \in E$. The vertex and edge weights are respectively given by

$$\begin{align*} 
w_\pi (u) &= |u|\\
w_{E_\pi} (uv) &= | \{ij \in E ~|~i \in u, j \in v\}|.
\end{align*}$$

It is easy to see that $G/0$ is a weighted graph isomorphic to $G$, with the all weights equal to one, and that $G/1$ is the weighted graph with a single vertex and a single edge (a loop), with respective weights $|V|$ and $|E|$. Note that in general, a coarse-grained graph will have loops.

Since we have a nice categorical structure on $\Pi(V)$, we might wonder if there is one too for coarse-grained graphs. We only need to define an appropriate notion of morphism of two weighted graphs. This is fairly straightforward. A morphism of weighted graphs $f : (V_1, E_1, w_1, w_{E_1}) \rightarrow (V_2, E_2, w_2, w_{E_2})$ is given by a map $f_V : V_1 \rightarrow V_2$ that satisfies the following.

1. $f_V$ is a *graph homomorphism* from $(V_1,E_1)$ to $(V_2,E_2)$, i.e. if $ij \in E_1$, then $f_V(i)f_V(j) \in E_2$.
2. For any $u\in V_2$, the weight of $u$ is the sum of weights of vertices in $V_1$ that get mapped to it. 

$$ w_2(u) = \sum \{ w_1(i) ~|~ f(i) = u \}. $$

3. For any $uv \in E_2$, 

$$ w_{E_2} (uv) = \sum \{ w_{E_1}(ij) ~|~ ij \in E_1, f_V(i)=u, f_V(j)=v\}. $$

The composition $g \circ f$ of weighted graph morphisms $f : (V_1,E_1,w_1,w_{E_1}) \rightarrow (V_2,E_2,w_2,w_{E_2})$, $g : (V_2,E_2,w_2,w_{E_2}) \rightarrow (V_3,E_3,w_3,w_{E_3})$ is simply defined in terms of the composition of the vertex maps $g_V \circ f_V$, and it is easy to see that this composition is associative, and that we may define identity morphisms using the identity maps on vertex sets. We therefore have a well-defined category of weighted graphs.

It is furthermore reasonably easy to see that if $\pi_1 \le \pi_2$ in $\Pi(V)$, we have a morphism $f : G/\pi_1 \rightarrow G/\pi_2$, obtained by mapping each $i \in \pi_1$ to the unique set in $\pi_2$ that contains $i$. This means that the map $\pi \mapsto G/\pi$ is a *functor* from the category $\Pi(V)$ to the category of weighted graphs.

## Coarse-graining of graph dynamical systems

We have just defined how to coarse-grain a graph using a partition of its vertex set, and that this operation is a functor from the category of partitions of $V$ to the category of weighted graphs. We will now look at how to coarse-grain data associated to the graph, namely, SIR-style dynamical systems.

Given some weighted graph $(V,E,w,w_E)$, we define its weighted adjacency matrix as 

$$ A_{uv} = \frac{w_E (uv)}{w(u)w(v)}. $$

This quantity can be interpreted as the probability of an edge between two vertices taken at random in the clusters $u$ and $v$.

We define variables $S_u$, $I_u$, $R_u$ for all $u \in V$. The chemical equations describing the system are

$$\begin{align*}
S_u + I_v &\stackrel{\beta A_{uv}}{\longrightarrow} I_u + I_v, ~~\forall u,v \in V\\
I_u &\stackrel{\gamma}{\longrightarrow} R_u
\end{align*}$$

and the corresponding meanfield equations are

$$\begin{align*} 
\dot{S}_u &= -\beta S_u \sum_v A_{uv} I_v\\
\dot{I}_u &= \beta S_u \sum_v A_{uv} I_v - \gamma I_u\\
\dot{R}_u &= \gamma I_u.
\end{align*}$$

The disease-free state for these equations is the one where $S_u = w(u)$ for all $u\in V$ and all other variables are zero. Linearizing around this state gives us the following decoupled equation

$$ \dot{\mathcal{I}} = (\beta W A - \gamma I) \mathcal{I}, $$

where $W$ is the diagonal matrix with entries $w(u)$. We can apply the same trick as for the IBMF to get the following epidemic threshold

$$ \frac{\beta}{\gamma} > \frac{1}{\rho(WA)}. $$

It's worth checking that this construction yields the HMF and IBMF when coarse-graining with respect to the $1$ and $0$ partitions, respectively. Using $G/0$ trivially yields the IBMF model. For $G/1$, there is only one partition set, so the "adjacency matrix" becomes $A = |E|/N^2 = \langle k\rangle / 2N$ by using some well-known identities. This is close to the approximation we derived earlier, with an additional factor of $1/2$ (I have yet to check the all the calculations, so this might be a mistake).

I will leave it at that for now, but here are some targets for after checking the calculations.

1. Beyond, the $0$ and $1$ partitions, another natural one from the network science literature is to partition vertices by degree. The weighted adjacency matrix would then encode the pairwise degree-degree distribution, and we should expect to recover the epidemic threshold from the literature. Note that a common simplification is to assume the degree-degree distribution is uncorrelated.
2. It is not yet clear if there is a reasonable notion of morphism for these weighted SIR models. I have some idea to what they might look like, and if it works, this would give a principled way to perform the kind of parameter transfer done at the beginning. My current understanding of renormalization is that it describes this parameter transfer, with morphism composition providing the "group" in "renormalization group". Is this accurate? If not, what is missing?
3. Beyond finite graphs, the coarse-graining framework could be applied to graph limits (namely, graphons) by replacing partitions with partitions into measurable sets with non-zero measure. One nice interpretation of that is that we would be studying a continuous object (the graphon) by looking at discretizations of it, much like the (homotopy/homology) structure of a topological space can be studied by studying the structure of its discretizations into simplicial complexes.
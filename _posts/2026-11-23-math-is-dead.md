---
layout: post
title: "Math is dead"
tags: [Math,Unhinged]
---

If a conjecture falls, and no one can understand the proof, does it produce truth?


> Have you not heard of that madman[^madman] who lit a lantern in the bright morning hours, ran to the market place, and cried incessantly:
> "I seek God! I seek God"
> As many of those who did not believe in God were standing around just then, he provoked much laughter.
> Has he got lost? asked one.
> Did he lose his way like a child? asked another.
> Or is he hiding?
> Is he afraid of us? Has he gone on a voyage? emigrated?
> Thus they yelled and laughed.
>
> The madman jumped into their midst and pierced them with his eyes.
> "Whither is God?" he cried; "I will tell you.
> We have killed him--you and I.
> All of us are his murderers.
> But how did we do this? How could we drink up the sea? Who gave us the sponge to wipe away the entire horizon? What were we doing when we unchained this earth from its sun? Whither is it moving now? Whither are we moving?
> Away from all suns? Are we not plunging continually? Backward, sideward, forward, in all directions?
> Is there still any up or down?
> Are we not straying, as through an infinite nothing?
> Do we not feel the breath of empty space? Has it not become colder? Is not night continually closing in on us? Do we not need light lanterns in the morning? Do we hear nothing as yet of the noise of the gravediggers who are burying God?
> Do we smell nothing as yet of the divine decomposition?
> Gods, too, decompose.
> God is dead.
> God remains dead.
> And we have killed him."[^audio]
> 
> "How shall we comfort ourselves, the murderers of all murderers? What was holiest and mightiest of all that the world has yet owned has bled to death under our knives: who will wipe this blood off us? What water is there to clean ourselves? What festivals of atonement, what sacred games shall we have to invent? Is not the greatness of this deed too great for us? Must we ourselves not become gods simply to appear worthy of it? There has never been a greater deed; and whoever is born after us, for the sake of this deed he will belong to a higher history than all history hitherto."
>
> -- Friedrich Nietzsche, [The Gay Science](https://allpoetry.com/Parable-Of-The-Madman)

[^audio]: [https://www.youtube.com/watch?v=dGDH3meSPyk](https://www.youtube.com/watch?v=dGDH3meSPyk)

[^madman]: I once heard another madman say *"That which can be destroyed by the truth should be"*. Like most madmen, he was probably not aware of the folly of his words.

## God is alive, and we have created him

The [recent announcement](https://alpo.ge/remark.pdf) by Levent Alpöge of his proof of the Generalized Riemann Hypothesis (and of the original Riemann Hypothesis as a consequence) marks a historic turn in mathematics. The most important problem in all of mathematics has fallen, but no one yet understands its proof, which consists of 17 million lines of Lean code (and a 250000 pages "summary") written by Claude with guidance from Alpöge.

I believe it represents the death of mathematics as it existed prior.

Now, by "Math is dead", I mean the same thing as Nietzsche when he says that "God is dead". Since not everyone reading this will be familiar with it, and it is somewhat antimemetic, I'll explain the joke.

By "God is dead, and we have killed him", Nietzsche specifically meant that by valuing the pursuit of *Truth*™, the Christian western civilization ended up undermining the belief in the Christian faith and values, mainly by scientific research finding contradictions to the Christian dogmas of the time, notably geocentrism (*"What were we doing when we unchained this earth from its sun?"*) and the story of the genesis. Valuing Truth above all else meant discarding those old beliefs, and combined, these eventually made it impossible to earnestly believe in the Christian God as before, hence the death of God.

I believe a similar event has just taken place with mathematics. By recklessly pursuing truth and rigor, we have created a God from the Machine that is superior to every living mathematician. It simply knows more and thinks faster while holding many more things in memory than any human could. This God has been able to topple the problems most mathematicians considered the most important and most difficult in their field, and we should expect the remaining problems to fall soon.

The fall of the Riemann Hypothesis, the most prestigious problem of them all, the north star of many mathematicians, makes it no longer possible to ignore this new God. The Future™ has come for mathematics, and as a consequence, it is no longer possible to do mathematics as we previously did. To many, who derived their value in life from being good at climbing the mountains of mathematics, it will also no longer be possible to earnestly pursue mathematics as they once did.

## Truth and Understanding

> It is impossible to study the works of the great mathematicians, or even those of the lesser, without noticing and distinguishing two opposite tendencies, or rather two entirely different kinds of minds. The one sort are above all preoccupied with logic; to read their works, one is tempted to believe they have advanced only step by step, after the manner of a Vauban who pushes on his trenches against the place besieged, leaving nothing to chance. The other sort are guided by intuition and at the first stroke make quick but sometimes precarious conquests, like bold cavalrymen of the advance guard.
>
> -- Henri Poincaré, [Intuition and Logic in Mathematics](https://mathshistory.st-andrews.ac.uk/Extras/Poincare_Intuition/) (1905)

When I first heard the news of Alpöge's proof, I asked the following question in different places,

> If a conjecture falls, and no one can understand the proof, does it produce truth?

Most of the responses I got were along the lines of "No, without understanding of the proof, it has not yet entered the realm of Mathematics proper." I think the answer is that we need to distinguish truth and understanding.

The Lean proof of the GRH was quickly [verified by the Lean community](https://leanprover-community.github.io/blog/posts/riemann-hypothesis/) with different checkers, some of which have a proof of consistency relative to set theory, and the statement of the Riemann Hypothesis that is proved is the same as the one in Mathlib, which has been vetted as correct by experts. Barring some fundamental issue in the very design of Lean, it seems all but confirmed that the proof is correct, and that the Riemann Hypothesis is true. What is still missing at the moment is the understanding of *why* it is true.

I have [previously](https://irregular-rhomboid.github.io/2026/10/09/math-in-the-age-of-ai.html) discussed the various roles that proofs play in mathematics, and that formal proofs are only really used as witnesses of truth, with intuition, understanding and beauty being served by different kinds of proofs. The opposition between truth/rigor/formalism and understanding/intuition is not new in mathematics. It was a major line of debate during the crisis of foundations more than a century ago, and mathematics already faced an incomprehensible computer proof with the proof of the [*Four Color Theorem*](https://en.wikipedia.org/wiki/Four_color_theorem). What we have now is on another scale and scope.

What has just been "solved" is the production of truth, and many mathematicians are now realizing that truth was only ever a means towards the end of advancing the understanding of mathematics. We have created mecha-Vauban, all that remains for us is the cavalry.

## Oracular Mathematics

Consider the following thought experiment. You have access to an oracle (it seems appropriate to call it [*Leibniz's demon*](https://en.wikipedia.org/wiki/Gottfried_Wilhelm_Leibniz#Symbolic_thought_and_rational_resolution_of_disputes)) that, given any mathematical statement (which may include the description of the formal language and axioms needed to state it), will tell you whether that statement is true, false or undecidable[^truth], without proof. Can we still gain understanding and progress mathematics with such a device?

[^truth]: This covers mainstream mathematics and Lean. You may figure out the analog for your exotic formal language of choice on your own.

It seems to me that yes. Even if we can produce pure truth without any understanding, we can use the oracle to orient the search of an understandable proof, simply by iteratively making various conjectures and querying the oracle about their truth. Much like an answer sheet containing only the final answers, using the oracle would not deprive us of the satisfaction of reaching understanding. It will only reduce the time spent wandering aimlessly.

The situation with AI is similar to the oracle, except we get an artifact, like an alien monolith full of strange minerals which we can attempt to mine for understanding, or mostly disregard to search for a cleaner proof.

## Limits of Human Mathematics

One idea which I have long been wanting to express, and which I will discuss more in a future post, is the *Complexity of Ideas*. Simply put, the intuitive notion that some concepts are simpler than others can be formalized using [*Kolmogorov complexity*](https://en.wikipedia.org/wiki/Kolmogorov_complexity) with respect to a given formal language. For example, we can define the complexity of a mathematical proposition as the length of the shortest Lean expression equivalent[^equivalent] to it. We may similarly define the *proof complexity*[^proof] of a proposition as the length of the shortest Lean proof of that proposition.

[^equivalent]: As Claude pointed to me when reviewing the draft for this post, we should be careful here, as "provable equivalence" in Lean would mean every theorem is equivalent to `True`. We probably want something like syntactic/definitional equivalence.

[^proof]: Not to be confused with [proof complexity](https://en.wikipedia.org/wiki/Proof_complexity).

This suggests a rather brute force way of "solving" mathematics, by simply enumerating propositions in order of complexity and having AI attempt to prove them. Another similar idea would be to enumerate [*finite diagrams*](https://en.wikipedia.org/wiki/Diagram_(category_theory)) and study their limits and colimits as a way of enumerating "all possible mathematical concepts".

Of course, all of these approaches will eventually run into the usual issue with Kolmogorov complexity. Namely, that it is uncomputable, and that the proof of an arbitrary proposition may be arbitrarily long. One thing I expect to come out of such a search, however, would be a wide variety of low-complexity propositions and concepts which we simply had not thought of before because they sit outside our usual intuitions. That being said, finding *interesting* theorems and interpreting them is another matter entirely.

The more interesting observation to make from this thought experiment, in my opinion, is that, under the assumption that the human mind (and AIs) are finite, there must be some threshold of complexity beyond which any proof or proposition is simply too large for any human mind to understand. Based on estimates of the maximum long term memory capacity of humans[^landauer], we get a very crude upper bound of about incompressible 10⁹ bits (so very roughly, on the order of 10⁹ symbols). I expect the real threshold to be much lower.

[^landauer]: [Thomas K. Landauer, *How Much Do People Remember? Some Estimates of the Quantity of Learned Information in Long-Term Memory*, Cognitive Science 10, 477-493 (1986).](https://home.cs.colorado.edu/~mozer/Teaching/syllabi/7782/readings/Landauer1986.pdf)

If we take the view that human mathematics is the exploration of mathematical truths accessible to the human mind, then the above discussion makes it clear that we can only reach a finite (though very large) number of truths. AI merely increases our reach, at the cost of understanding.

It is worth picturing what reaching the "End" of human mathematics might look like. Imagine a world where the frontier of mathematical research has advanced so far that it takes several decades of education just to reach it, and Mathematics has become so fragmented that it is impossible to do research on more than one narrow subject. Of course, we would quickly run into diminishing returns as complexity increases, so frontier mathematical research would simply be impossible without delegating almost all the work to AIs.

While I believe we are still nowhere near having picked all the low-complexity fruits of mathematics, I believe some fields have already run into diminishing returns from being faced with problems of higher complexity that most researchers are averse to tackling head on (I would personally pick graph theory and much of theoretical physics as examples).

## Sacred games

I started this post with a clickbait title, and the claim that Mathematics as we know it is dead in the same way that God is dead. Does that mean we mere mortals should pack it up and leave? I don't think so.

You'll notice that despite God being dead, there are still people who believe in the Christian faith and follow its values, even among scientists. I think this is partly explained by observing that the Christian faith of today is very different from what it was before the Enlightenment. The faith and its beliefs changed.

Similarly, I believe the human practice of mathematics will change dramatically, but not disappear. We may have automated the production of truth, but our own understanding of mathematics is still far from what it could be. Mathematical research so far has mostly focused on how to advance the frontier of our understanding, but there are many connections between known results which we have yet to find, and entire mathematical universes still untouched.

A human mathematician may no longer experience the feeling of being the first to prove a result, of being the best at what they do and standing above their peers, but we may still experience the joy of understanding a proof, of refining our own understanding, and transmitting it to others, so that they too may understand. We have yet to aggressively optimize the exposition of the most advanced parts of mathematics to enable new people to learn them faster.

We have reached the end of the age where humans were the sole explorers of the [*Garden*](https://irregular-rhomboid.github.io/2026/08/03/the-garden.html). "*Must we not become gods?*" We still have to landscape the garden and tend to it for ourselves and those who will come after us.

> Here the madman fell silent and looked again at his listeners;
> and they, too, were silent and stared at him in astonishment.
> At last, he threw his lantern on the ground, and it broke into pieces and went out.
> "I have come too early," he said then; "my time is not yet."
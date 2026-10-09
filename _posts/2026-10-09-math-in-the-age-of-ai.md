---
layout: post
title: "Will we continue mathematical research?"
use_math: false
tags: [Math, Hot takes]
---

With the [recent](https://github.com/openai/math/tree/main) [results](https://openai.com/index/navier-stokes-solution/) from [OpenAI](https://openai.com/index/model-disproves-discrete-geometry-conjecture/), [Deepmind](https://arxiv.org/abs/2605.22763) and [others](https://fxtwitter.com/axiommathai/status/2059640252546126087) it is now undeniable by anyone except the terminal copium addicts that Frontier LLMs are capable of doing research-level mathematics. With this observation comes an important discussion about what the future of mathematics (and scientific research at large) as a discipline looks like. The meme answer is to say that all mathematical research will eventually be carried out by AI with little (if any) human input, and with many mathematicians quitting mathematics since they cannot compete with AI. More precisely, there are two closely related answers,

1. Future mathematical research will be largely delegated to AI agents.
2. Most of this research will be in the form of formalized Lean proofs.

I'm not particularly convinced this is true, and the goal of this post is to present reasons for why I think there will still be human mathematicians in the future[^pdoom], and why one might still pursue mathematics in spite of the superiority of AI.

[^pdoom]: This is, of course, assuming a future where humans still exist, which admittedly, I do no think is comfortably likely.

## Prologue: Two attitudes towards AI

When thinking about *using* AI as a technology, I think there are broadly ~~two~~ three mindsets (which are neither exhaustive, nor exclusive)

1. "Ah sweet! I can now spend *less time* on things I don't like"
2. "Ah sweet! I can do *more* of the things I like, including things I couldn't do before"
3. "It's all over. I am now obsolete and will die homeless"

I will mostly be talking about the first two. We'll come back to the third later.

I think the first mindset is ultimately negative, because you're using AI to minimize your own effort, whereas the second mindset leads you to maximize the amount of things you are doing (which still involves effort on your part).

To illustrate, I've [heard](https://trends.levif.be/a-la-une/tech/fabien-pinckaers-de-la-quasi-decacorne-odoo-grace-a-lia-nous-engageons-du-personnel-supplementaire/) that the company Odoo used AI to streamline their customer support service, notably by reducing the time to resolve customer tickets. Prior to this, Odoo's customer support was swamped despite being around 600 operators, and it took four days on average to resolve a ticket. After rolling out the AI system, about 40% of tickets were automatically handled by AI, and the improvement in quality of the service lead to customers using support *more*, leading Odoo to hire more support staff.

This is an example of the second mindset, where AI is used to *improve the quality* of a service. The other mindset, typical in bean counter managers, would have been to fire all support staff and replace them with chatbots, at the cost of a decrease in the quality of the service, but massive savings which would be [celebrated as increasing shareholder value](https://www.palladiummag.com/2024/08/30/when-the-mismanagerial-class-destroys-great-companies/).

Note that in this case, AI enabled Odoo to solve their problem, which probably wouldn't have been possible just by scaling up their support staff. On top of that, I would bet that the job of those support staff improved as well, as a lot of support requests were probably all for the same basic recurrent problems.

tldr. I think using AI solely to save time and money is ultimately toxic, and that you can instead use AI to increase your reach and make your work better than it would be otherwise, and that is a positive way to use AI.

## A vibe taxonomy of results and proofs

Not all theorems and proofs are created equal, and I think it's useful to distinguish different types of results when discussing the use of AI for mathematics. Here is a subjective, (and not necessary complete) list that applies to mathematical problems as well as proofs.

1. **Trivial results**: The result is considered so obvious as to not needing being proven (or even stated) formally. Elementary arithmetic, or the linearity of a certain map fall in that category.
2. **Tedious results**: The result is expected to be true a priori and the proof is not complicated, but may involve a lot of steps. This covers most results involving inequalities, such as concentration inequalities, well-posedness of PDEs, convergence rates, Lipschitz bounds... In most of these cases, the precise constants are important, but the actual proofs themselves consist of line after line of inequalities that I refuse to believe anyone takes pleasure reading.
3. **"Connect the dots"**: Certain proofs involve importing tools and results from other fields of math. When done well, this involves a lot of creativity in recognizing the connection in the first place, and a lot of nontrivial steps in building it formally[^connect]. This style of proof is more or less what category theory was built for. Doing it well beyond the surface level requires knowing a lot of literature, however. OpenAI's unit distance counterexample is arguably an example of such a result.
4. **"Divine inspiration"**: The most prized type of proof involves making highly nontrivial steps that seemingly come out of nowhere. Quite often these come from "shower thought" moments, where one has been thinking about a problem for a long time and the solution just pops out instantly from the unconscious. 
5. **Formalization**: Arguably the most important problems in mathematics are ones that do not have a fully formal statement, and proving them involves spending a lot of time trying to come up with the *Right* definitions. This is very hard and is sometimes closer to philosophy, but when successful, the results often completely change the face of mathematics. The formalization of set theory and computation, or the theory of distributions in the last century are examples of such results.
6. **Ex Nihilo**: Related, but somewhat rarer than the previous category, some results start by inventing some completely new concept and exploring its consequences. This is often *very* hard, because existing notions tend to act as "*conceptual attractors*" that make it difficult to think outside of them, and furthermore finding *interesting* new definitions that generate a lot of results is not easy either. Much of Grothendieck's work in Category Theory and Algebraic Geometry falls within that category. I believe the nascent theory of [*Condensed sets*](https://en.wikipedia.org/wiki/Condensed_mathematics) is another example.

[^connect]: Incidentally, this is the approach to mathematics I personally prefer.

There is a clear trend within this classification of going from well-stated and formalized problems to more open-ended problems, and I expect AI and computers to generally perform better at the lower part. Category 1, for example, can already largely be automated without AI (e.g. using Lean tactics). Category 2 can be automated similarly to some extent. 

I think we have clear evidence that current LLMs can do Categories 1 to 3 (their difficulties with arithmetic notwithstanding), and possibly 4, but I do not have the expertise to judge that for OpenAI's results. This is consistent with the capabilities of LLMs in other domains, where they are able to apply and combine things that are well-represented in the data distribution. This is boosted by the ability for current models to search the web for references, effectively making them superhuman at literature search.

I have yet to see evidence of LLMs performing well at Categories 5 and 6, and in my limited personal experience, models tend to perform poorly on such problems. I think you can make a reasonable argument that LLMs should be fundamentally incapable of doing 6, given that by definition, it requires outputting something out of distribution, but I'm not personally convinced AI will never be able to do it. I do expect AI to eventually be able to do 5.[^benchmark]

[^benchmark]: A good benchmark template I would suggest for that would be "Consider {some class of mathematical objects}. What is the right notion of morphism between them so that we get a category, and what are the properties of this category?" This should be done with objects that haven't been studied categorically yet.

## What do we use proofs for?

In the discussion about automating formal proofs of mathematical theorems, very little consideration is given to the role proofs actually play in mathematics. A formal proof verified by a proof checker such as Lean is seen as the end goal, and any two proofs of the same result are equivalent (this is the case in Lean), so that once we have that, the result can be applied without reading the proof.

In his essay *On proof and progress in mathematics*[^thurston], William Thurston argued against the reductive view of mathematics as merely the production of theorems, and proposed instead that the main purpose of (human) mathematics is to *increase the human understanding* of Mathematics (understood as the "Platonic realm" of formal patterns). Formal proofs are only a small part of that (and often run against that goal).

[^thurston]: William P. Thurston, *On proof and progress in mathematics*, (1994). [https://arxiv.org/abs/math/9404236](https://arxiv.org/abs/math/9404236)

Thurston gave the examples of the partially automated proof of the four color theorem[^4color] and Mochizuki's proof of the abc conjecture[^mochizuki] as instances where results were not broadly accepted as true by the mathematical community, despite claims of a proof. In both cases, the proofs were criticized for being too complex to check manually or understand. In short, it is often more important that the proof of a result is understandable by other mathematicians, rather than it being fully formalized and verified.

[^4color]: The [four color theorem](https://en.wikipedia.org/wiki/Four_color_theorem) is a famous theorem stating essentially that for any partition of the plane into contiguous regions, up to four colors are needed to color every region so that no adjacent regions have the same color. The proof of this theorem in 1976 essentially reduced the problem to a large number (1834) of special cases, which were solved using a computer program.

[^mochizuki]: Shinichi Mochizuki is a Japanese mathematician who claimed in 2012 to have a proof of the [abc conjecture](https://en.wikipedia.org/wiki/Abc_conjecture). The proof rests on a large amount of novel theory that is reportedly dense and hard to understand, and for this reason, the proof is still not widely accepted by the international mathematical community.

Formal proofs are bad at being understandable in general, and Lean proofs, being designed for computers rather than humans, are even worse. By contrast, some form of proofs like geometric proofs (e.g. proofs by drawings) are very effective at conveying the intuitions for a result, but are basically impossible to formalize in Lean. 

Another important aspect of mathematical proofs is that some proofs are considered more [*beautiful*](https://en.wikipedia.org/wiki/Proofs_from_THE_BOOK) than others. In addition, novel proofs of existing theorems[^pythagoras] are usually considered results in their own right (though usually minor ones). All these proofs contribute to the advancing of mathematics by showing more facets of known results.

[^pythagoras]: There are hundreds of proofs of Pythagoras' theorem, for example.

Furthermore, there is a lot more to mathematics than theorems and their proofs, and a lot of time is spent grappling with pre-formalized ideas before nailing down the right definitions and statements. Much of this work is being done informally by mathematicians thinking inside their heads with ideas that they can't even state using language.

To sum up this section, proofs serve multiple roles in mathematics. One is to serve as "*witness of truth*", which is the role intended for formal proofs. Another is to communicate to other mathematicians *why* a result is true, and yet another is to show more facets of a result, as well as elicit "*aesthetic experiences*". These latter roles are often poorly served by formal proofs.

## LLMs and Symbolic calculators

Despite all I said in the previous section, I still view the formalization of Mathematics as a worthwhile endeavor, and I do believe that it, and AI will have a place in the future of mathematics.

The purpose of any tool or technology is to substitute or assist human labor at tasks either too tedious, or too voluminous for humans. There is no shortage of such tasks in mathematics. The "tedious results" described in the first section are a prime example of mathematical problems I think most people would have no qualms leaving to AI. In addition, I'm sure that AI will become a valuable tool for tackling large scale proofs, similar to the classification of finite simple groups[^finite].

[^finite]: The [*Classification of finite simple groups*](https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups) is a theorem in group theory characterizing all the possible types of finite simple groups. The proof of this theorem is one of the largest collective efforts in mathematics, and involved about a hundred authors over the span of 50 years.

I think AI and proof checkers will be of tremendous help in mathematics and physics as they'll enable us to tackle problems of scale and complexity that are unapproachable with only human means. They will be even more useful in applied math and other scientific fields faced with similar challenges coming from the real world (climate change, for example).

In this way, AI could be not so different from symbolic calculators such as Mathematica, which are already used by mathematicians and physicists to help them manipulate complicated algebraic or analytical expressions, which would take them too much time to perform by hand.


## Intermezzo: `simp` considered harmful?

This section is an aside on Lean specifically which I decided to include because I have been learning it a bit lately, and had some thoughts about it tangentially related to this post.[^snort]

[^snort]: Also, I like to imagine some readers will snort a laugh while reading the section title.

To start of, I'm generally enthusiastic about projects like Lean, as I've long felt that the process of proving mathematical statements is similar to designing a computer program, and that Mathematics could gain by adopting techniques from computer engineering.

I have been learning Lean by reading the official manual, as well as playing with the [Lean Game Server](https://adam.math.hhu.de/), and while the experience has mostly been fun, I did have some gripes while doing it.

Lean has two main ways of writing proofs. The first one involves constructing terms in Lean's functional programming style (Lean, like all proof assistants of its type, are based on the Curry-Howard isomorphism). In this way, the structure of proofs is very explicit, and directly follows that of the underlying code. The downside is that it is very verbose.

The other way to construct proofs is via *tactics*, which essentially allow for building complicated terms automatically using powerful macros. For example, the `simp` macro will try to automatically prove an equality using an extendable set of rewrite rules.

There are a couple issues I have with the tactics system. The first is that its syntax leaves many things implicit (which is the point), and as a result, tactics proofs are "write-only", in that it is hard to interpret them without the help of Lean's interactive mode. The second is that when trying to solve exercises on the game server, I would often find myself half-blindly trying tactics until the proof was complete. This may be an artifact of the game server, but I fear it may be inherent to the tactic system that you are incentivized to just brute force through some steps of a proof.

Why am I bringing this up? Simply, if we accept the premise that the goal of human mathematics is to increase the human understanding of abstract patterns, then writing proofs directly in Lean (or with AI) may run against that goal.

## What's wrong with AI math?

Many people are puzzled by the generally hostile response from the math community after OpenAI [launched a missile strike all over pure math](https://github.com/openai/math/tree/main). Surely, mathematicians should be pleased that so many of the open problems in their fields have just been solved. Right?

On the zeroth order, yes, solving these problems is a positive contribution to mathematics. That is not the issue. It's OpenAI's attitude in releasing these results, and the actual form of those results that people take issue with.

It's quite clear that OpenAI's primary motive in releasing these results is not the advancement of mathematics, but an investor pitch. None of those problems needed to be solved urgently, and OpenAI only sicced their model on them to test its capabilities, then chose to make some publicity by releasing them. This is not the behavior of someone who cares about progress in mathematics. It's the behavior of someone who doesn't get it and doesn't care.

The traditional process of math research is to spend a lot of time and care on a result before publishing it (it is not uncommon in certain fields to spend several years on a single paper). Rushing to publish a half-baked result is considered poor form, and rushing to scoop another researcher is seen as uncouth. That is more or less what OpenAI has done with their Navier-Stokes result, and their recent shrapnel blast of theorems (some of which they already retracted after people found embarrassing mistakes in them).

A few people are comparing AI math to math from a hypothetical alien civilization. I think this analogy is wrong, because an alien civilization would have its own history and tradition of mathematics, with hopefully some similarities due to natural abstractions, but would otherwise be completely different from human math. AI math is not alien, it is *uncanny*. It looks legible at first, but as you try to read it, something feels wrong. Arguments are convoluted, full of jargon, and often far more complicated than they need to be. Reading AI math feels like reading something that tries to mimic human math (because that's exactly what it is), but ends up in the uncanny valley. The result is extremely tedious and unpleasant to go through. Instead of feeling enlightened as you read a well-constructed explanation, reading AI is a grueling slog where you have to fight it to understand it.

What might really be alien mathematics, is what would happen if we just let AI work on pure math on its own for some time. Eventually, it would have diverged so far from human mathematics that it would be completely unintelligible. At that point you'd have made a very expensive space heater that produces nothing of value. No one would care to read incomprehensible AI math.

To give an idea to non-mathematicians of how mathematicians feel about the way OpenAI is behaving, imagine taking an artist, and spamming AI generated pastiches of their style on Twitter. It will have some of the vibes of the original, but subtle details will feel wrong, and the whole thing will feel like tasteless disrespect towards the artist, like desecrating their work, mocking them for spending so much of their time learning their skills, and calling them Luddites when they take offense at your disrespect. That is exactly what OpenAI has done to mathematics.

## Where AI can enhance research

I think many of the ways AI is used nowadays are negative, mostly because they come from the "less effort" mindset. I do believe there are positive ways to use AIs to do mathematics *better* than without. For example,

- By virtue of being trained on virtually all scientific literature, and being able to search the internet, publically available models from frontier labs are superhuman at literature search, which is extremely valuable for scientists, as the sheer scale of the scientific literature has become far beyond what any human can manage.
- Frontier models are also decent reviewers, and will happily poke holes in any draft you send them. Of course, the recent allegations of AI plagiarism by OpenAI imply this is not necessarily safe to do.
- Having a Lean proof of a result is always valuable, and AI is great at streamlining most of it, which would otherwise be a painstaking endeavor.
- Finally, AI is obviously helpful to bridge some step of a proof when stuck, or coming up with (counter)examples.

I think most practicing mathematicians would have no issue with a paper using AI for any of the above (provided said use is declared), because it's using AI to increase the quality of one's work, in ways that would be extremely labor-intensive for a human.


## Mathematics as a form of art

What if AI gets competent at writing actually *good* math papers? I would certainly not bet against it, but I honestly don't know how mathematicians would react. However, I do believe there would still be humans doing math.

In the early 70s, the legendary mathematician Alexander Grothendieck gave a number of conferences throughout France titled [*Will we continue scientific research?*](https://github.com/Lapin0t/grothendieck-cern) In them, he asked his audience questions he himself had been grappling with for several years, about the purpose of scientific research:

> when the question is asked: "What is the social purpose of science?", practically nobody is able to answer. The scientific activities we engage in don't serve to directly fulfill any of our needs, any of the needs of our loved ones, of people we may know. There's a perfect alienation between ourselves and our work.

Grothendieck's conclusion was that science as it stood was unable to tackle the really important problems of modern civilization (notably ecological collapse), and that the best he could do was think about how to move to a new civilizational paradigm. He eventually quit the academic world altogether, as he could no longer work in good conscience on mathematical research.

Without going as far as Grothendieck, we can still ask ourselves what the social value of mathematics is. When people say they think mathematics will be fully automated, I think they are confused as to what the actual goals of mathematics are, and what motivates mathematicians to do their work.

Simply put, the vast majority of mathematics, (particularly pure mathematics, but large segments of "applied math" as well) has no direct application to non-mathematicians, and is not motivated by concrete problems. Most mathematicians work on their problems primarily for their enjoyment. In this regard, mathematics should not be regarded as an economically valuable activity, but rather as a form of art[^art]. To ask "What is the purpose of mathematics?" is exactly the same question as "What is the purpose of music?".

[^art]: Note that much of the critique that can be levied against the high art community (namely, elitism and a tendency towards increased abstraction) applies just as well to the highest spheres of mathematics. The only difference is that mathematicians are patronized by states, whereas succesful artists are patronized by rich individuals. Math, just like art, is a *luxury*.

I think this gives the best argument for why mathematics won't be fully automated. Mathematics will not be industrialized, because there is no reason to, except burning money as a flex. Of course, I expect that the subfields of mathematics that are directly motivated by applications (and are thus considered less 'noble'), *will* be automated in whatever industries use them.

This is not to say that I expect academia to thrive in the future. The combination of AI and shrinking research budgets everywhere is bound to put academics under even more competitive pressure, and I expect a lot of mathematicians will find themselves leaving universities (willingly or not).

I think mathematics, like many other things will have to change in order to continue existing as a human endeavor. I hope that it changes by throwing away the toxic incentives currently driving academia, and takes the idea of math as art seriously.

One can dream.




---
layout: post
title: "The Hitchhiker's Guide to Research"
use_math: false
tags: [Science]
---

The purpose of this post is to provide a somewhat opinionated guide to doing scientific research (mostly in machine learning) for people outside traditional research institutions. There are already several excellent guides on writing papers and how to work on research projects (see below), so I aim for it to be a complement to those that can still serve as a standalone guide. Specifically, this guide covers “basic” concepts that I’ve often seen people confused about. The last section also contains links to various tools and resources.

Be aware that what I say here is based on my own perspective, and that some of my takes may be considered “spicy” in certain circles. As with all things, you should read this critically, and decide for yourself whether you agree with what I say.

Many thanks to Quentin Anthony for their careful review and pertinent suggestions on this guide.

## Similar guides

- [Neel Nanda’s sequence on his own research workflow](https://www.alignmentforum.org/s/5GT3yoYM9gRmMEKqL)
- [Roads to Research (Cohere)](https://sites.google.com/cohere.com/coherelabs-community/community-programs/roads-to-research)
- [Nasa Open Science Training](https://science.nasa.gov/open-science/training/)
- [Just Know Stuff - Patrick Kidger](https://kidger.site/thoughts/just-know-stuff/)

**Guides on writing papers**

- [How to write ML Paper - Jakob Foerster](https://www.jakobfoerster.com/how-to-ml-paper)
- [Writing a good scientific paper - Michael J. Black](https://perceiving-systems.blog/en/post/writing-a-good-scientific-paper)
- [How to write a scientific paper - Jari Saramaki](https://users.aalto.fi/~jsaramak/HowToWriteCommsCoffee.pdf) (these slides are the abridged version of the book by the same author, which is highly recommended) 
- [How to write an okay research paper - Sasha Rush](https://www.youtube.com/watch?v=qNlwVGxkG7Q)
- [The Art and Arcana of Scientific Writing - Jason Alan Fries](https://web.stanford.edu/~jfries/assets/slides/BIOMEDIN-212_scientific-writing.pdf)

## What is research?

*Scientific Research* is an activity whose nominal aim is to produce novel *scientific knowledge* by following a set of techniques collectively known as the *scientific method*. This entails making claims based on a *mental model* and providing *evidence* for them, either through experiments or mathematical proofs. Importantly, research is a *collaborative* endeavor. A large part of scientific research is communicating with other researchers and collaborating on projects.

What exactly counts as ‘novel’ and ‘knowledge’ will be detailed later, but the important part here is that for some work to be considered scientific research, it has to follow certain *norms* that most people outside of academia are not necessarily aware of.

It is also important to know that the above description is somewhat idealized, and that the specific norms for what counts as valid research may vary between different disciplines, and in addition there are many instances of academic fraud both in ML and other fields.

## The academic research trajectory

Scientific research is currently primarily done in academic institutions such as universities or research institutes, with some research performed within private companies or public communities. While this guide is mostly intended for people working outside academia, scientific norms are largely the same as academic norms, so it is worth looking at the “typical path” into research.

The “entry level” researcher is the *PhD student*, typically being taught to do research during 3 to 4 years, sometimes more, under the supervision of an experienced researcher (known as the *PhD advisor*). It is very common for PhD students to come from undergraduate or masters studies, where they might have already had some small research experience. Unlike undergraduate or master studies, however, a PhD student is not usually taught with formal lectures, instead they are expected to be able to learn most things on their own while working on projects with occasional guidance from their supervisor.

The capstone of a PhD is the *doctoral thesis*, which consists of essentially a short book summarizing the research done by the student over the course of their PhD. This thesis is challenged during an evaluation known as the *PhD defense*, where a panel of researchers read the thesis and question the student. If this evaluation is passed, the student is then awarded the title of PhD, which is often a requisite to apply to research roles in academia and some companies.

After their PhD, a researcher wishing to continue working in academia will typically have to perform one or more *PostDocs*, two to three years projects in institutions abroad, before applying to open academic positions. Such positions are not abundant, and it can take multiple tries to finally find a position. Staying on the academic path is not necessarily worthwhile, and many researchers move to industry or private labs after their PhD, where they often have much better pay while still being able to do research (many also quit research altogether).

The advantages of this route are that one is mentored into research by experienced scientists, and additionally has access to many opportunities not open to people outside of academia, such as doctoral schools, training programs, academic HPC clusters… Arguably the most important benefit is having direct access to experienced and intelligent people who can be consulted for guidance on a problem.

One downside is that academic institutions are often constrained by funding, and as such, many (if not most) academic researchers are under pressure to publish frequently in prestigious journals, and apply for grants to fund their research. This often leads to prioritizing short research projects on popular problems to the detriment of longer projects, as well as academic fraud in some extreme cases. In short, it encourages a specific form of academic slop.

## Doing research outside of academia

It is possible to do research without taking the PhD route. Often this can be done in private companies, where research projects are typically more applied and directed towards company goals. Thus, while the pay is usually much better than academia (especially in tech companies) you are rarely free to choose your own research questions.

Another option is to join an open science community, where you can contribute to research projects and possibly use that as an entry point to collaborate with other researchers. Doing research completely independently without prior experience is generally not a good idea, as without guidance from a mentor or feedback from peers, you are more likely to get things wrong and become a crank.

Compared to academia, doing research like this is often an uphill battle, as it is harder to find funding or be able to fully dedicate your time for research. It is also harder to find mentors and collaborators who can give you feedback and access to their network.

## Important skills for doing research

Most people would probably say that in order to be a scientist, you have to be “smart”. While that is part of it, we can be more precise by looking at various qualities that are important or useful for doing research. They may not be essential, but they are usually good signals that someone has the potential to be a great researcher.

- **Creativity:** Scientific research is fundamentally a creative activity. You are literally trying to figure out something that is not currently well-understood. Being able to come up with solutions to problems on the fly, and thinking outside the box, is an extremely useful skill (you are by definition working outside the box). 
- **Knowledge:** Any research project exists within an ecosystem of previous work. Being well-read with the literature and aware of what goes on in other disciplines is extremely useful, because it can help you find the existing solution to one of your current problems, or draw links between different ideas. This is obviously something that builds up over time, but the benefits are compounding, so reading a lot and keeping organized notes early can go a long way.
- **Communication Skills:** Half of research is communication. Be it writing papers, giving talks or being able to explain complex ideas simply, the ability to express your thoughts well is important to make your work more impactful, yet neglected by many. You might have found a proof of the Riemann Hypothesis, but if your proof is in a poorly written Word Document, nobody is going to read it.
- **Perseverance:** Serious research is not something that can be effectively planned. In any research project, there are many dead ends, unforeseen obstacles and reviewers asking you to do additional experiments. Success rarely comes on the first try, and you have to be prepared to keep trying without getting discouraged.
- **Technical skills:** Research, especially in ML, often requires a lot of math or programming. You therefore need to be proficient in at least one of these, preferably both. Part of it is [just knowing stuff](https://kidger.site/thoughts/just-know-stuff/).

There is another important skill, which [Neel Nanda](https://www.alignmentforum.org/s/5GT3yoYM9gRmMEKqL/p/Ldrss6o3tiKT6NdMm) describes as “*Research Taste*”. It can roughly be described as the ability to discern promising research ideas and prioritize them, and avoid dead-ends. We can think of it as a collection of heuristics that help a researcher make decisions. This is a skill that develops with experience, and you should continually refine it by evaluating the outcome of your decisions. 

For example, you may decide to learn some topic or programming tool because you think it could help you solve one of your problems, or try to implement a galaxy-brain algorithm. This often represents a large time investment that may be wasted if you were wrong in your assessment. Having a good research taste means you’re able to better gauge which tasks are worth the effort and which ones are not.

## Research Projects

One’s research is articulated into *research projects*. Basically, projects scoped around a single problem or theme. The end goal of a research project is typically to turn it into a *publication*, but sometimes a single project can spawn multiple papers.

In general, a paper can be broken down into several *claims*, Claims are statements that the authors assert to be true. The goal of the paper is to provide *evidence* (also called *findings* or *results*) for those claims, i.e. arguments that support them. The philosophy behind this is that claims supported by sufficient evidence form *Knowledge*. There are multiple types of evidence:

- **Mathematical proofs:** Formal mathematical statements (Theorems, propositions, …) along with their proof. This is just about the strongest type of evidence you can have, provided your mathematical model is correct. Formal proofs are hard to do in general, but the simplest kinds are things like computing the algorithmic complexity of an algorithm.
- **Experiments:** Empirical experiments, either on real or synthetic data, along with an analysis of their results. It is often a good idea to have those alongside any mathematical proof as additional evidence and to provide examples.
- **Evaluations/Benchmarks:** A special type of experiment meant to compare the performance (along a certain number of metrics) of several methods. These are often made to provide evidence for claims that a novel method is more effective than existing ones.

Experiments and mathematical proofs are complementary in both directions. It’s a good idea to take empirical data to show that your mathematical model accurately reflects the real world. Conversely, defining a mathematical model from first principles to explain your empirical data ensures that your results are grounded and generalizable.

On top of those, there is a distinction between *strong evidence* and *weak evidence*. That line is fuzzy, but we can provide a few examples.

- Beating existing methods across a wide range of model scales, datasets and hyperparameter settings with additional ablation studies is strong evidence. Beating bad baselines that you cooked yourself is weak evidence.
- Showing that a new architecture performs well across a wide range of tasks is strong evidence. Showing that it works well on MNIST is weak evidence (if evidence at all).
- Doing rigorous statistical analysis (e.g. hypothesis tests) of numerical results is strong evidence. Vibe checks on graphs are weak evidence (or outright lies in some cases).

In general, the more precise and *quantitative* (as opposed to *qualitative*) the evidence, the stronger it is. Quantitative means looking at concrete numbers (metrics) from your data, while qualitative means mostly vibes. For example: “Variable X is strongly correlated with variable Y (r = 0.8)” is a quantitative statement that is stronger than “Visually, variables X and Y are in good agreement”.

Further, demonstrating *generalizability* helps strengthen your evidence. There are many cases in ML where a new claim presupposes a very rigid mixture[^spherical-cows] of dataset, model, optimizer, hyperparameters, etc. This often doesn’t stop authors from claiming a general solution. Large portions of modern ML research is inherently empirical science, where strong theoretical proofs of correctness are rare or impossible. This is partially why many papers aren’t reproducible, and also why it’s a good idea to pre-emptively include many disparate ablations to back up claims.

[^spherical-cows]: Also known as [spherical cows in a vacuum](https://en.wikipedia.org/wiki/Spherical_cow).

It is a good exercise to take a paper you’re reading and figure out what it’s claims are, and what evidence it provides for them (write them down explicitly). Bonus exercise: Where do you usually find the main claims of a paper, and why?

## A typical research project

As research is fundamentally a creative activity, research projects actually follow a similar scheme as artistic projects: *idea*, *execution*, then *communicate*.

- **Idea phase:** Every project starts with an idea. Most people fail at this stage, thinking just having an idea is enough. It is not. At the beginning of a project, things can be quite confused and time must be spent figuring out concrete steps to move to the next phase. It is useful to spend time reviewing literature to find out if your idea has been done before.
- **Execution phase:** This is the most important phase and consists on doing the necessary work to obtain results. This can involve many intermediate steps like writing code, running experiments, analyzing data, writing proofs… Everything here is meant to provide results to include in the final publication. Some of the assumptions you made in the previous phase will likely turn out wrong, and you should revise your mental model as you go along.
- **Communication phase:** Once you have collected enough results to gather into a cohesive story, it is time to write them up into a document for other researchers to read. While this is typically done in the form of a paper submitted to a journal or conference, some smaller-scale projects might be better for blog posts, especially if there aren’t many novel results.

This structure often loops around itself on multiple scales, and at the early stages of a project it’s a good idea to ideate, execute on some ideas and get feedback from peers/mentors/advisors quickly, and keep iterating that with as short a feedback loop as is practical. At intermediate scales, communicating partial results in a workshop or seminar is a good way to get feedback, and peer-review is pretty much the last iteration of this loop before publishing a paper.

To continue the comparison with artistic projects, a research project is similar to making a movie. In order to make a movie, one typically starts with a rough idea and develops it into something more precise (idea). After that, much time is spent on writing the script, visual design, casting actors, making props, then recording scenes (execution) and finally editing them to assemble the final movie, often leaving many results for the supplementary material (communicate). If papers are like movies, blog posts are more like indie short films made on a shoe-string budget. Blog posts are also great avenues for negative results, so we can also think of them as direct-to-DVD or direct-to-streaming releases of movies that would otherwise never see the light of day due to perceived weakness. Supplementary materials are DVD extras.

Many people seem to think they can just be good at phase 1 and find collaborators to help them with the rest. This couldn’t be further from the truth. **Ideas are worthless without the skills to execute on them**. If you can’t do significant parts of your idea by relying on your own skills, you are unlikely to find people willing to work with you. Most of the effort on a research project is spent in phases 2 and 3.

## Research outputs

The typical outcome of a research project is a *paper* published in a peer-reviewed journal or conference. The “peer-review” part means that the work is read by other researchers (*reviewers*), who give feedback on whether the work is good enough to be published. The idea is that this serves as a form of quality control. While it’s [debatable](https://www.experimental-history.com/p/the-rise-and-fall-of-peer-review)[^peer-review] how effective this is, peer-reviewed publications are still considered the gold standard for legitimate research. Getting a paper published this way can be a long and difficult process (several months for most journals) and it’s probably not a good idea to try that on your own without guidance.

[^peer-review]: To be clear. Peer Review is somewhat effective at ensuring a minimal level of quality, but the quality of a peer-reviewed paper can vary a lot depending on the field and journal, and there is still a shocking amount of fraud that gets published. There are [decent arguments](https://www.experimental-history.com/p/repost-science-is-a-strong-link-problem) for why peer review is more detrimental than not.

Because getting papers published takes a lot of time, it is very common for researchers to upload their work to *preprint servers* like arXiv. The point of this is to let other researchers read the work without waiting for publication, as well as avoiding getting “*scooped*” (i.e. someone else publishing the same idea before you). It’s important to understand that submitting to arXiv does not count as a proper publication, even though in fast moving fields like ML, it is very common to consider the arXiv version as a quasi-definitive version and cite it in articles before the definitive version is published.

There are research outputs beyond papers, however, and while they are often not recognized as much as they should, they are still valuable contributions. For example, many researchers have blogs where they write about their ideas in a less formal way than in proper papers. The advantage of this is that because there is no pressure for novelty or following the academic paper format, blog posts can present partial results or intuition pumps that are highly valuable, even though they wouldn’t fit in a normal paper. Blog posts are also good writing practice on top of that.

Another type of research output that is not well recognized is code bases. Writing a good open source implementation of something is valuable to the community as a whole, but will rarely be considered enough for a publication. There are a few journals dedicated to publishing articles about software packages, and writing substantial open source contributions is valued to a degree, but not as much as proper publications.

## What counts as novelty?

One of the important norms when trying to publish research is that it should be “*novel*”. This is often confusing, but generally something novel is something that has not been the subject of a publication before. This implies a few things.
- If someone executes on an idea and publishes it before you do, that idea is taken, and you can’t publish it. It doesn’t matter if you had the idea before or if you executed on it better.
- Papers are expected to be aware of previous and similar works in their topic and credit them accordingly by citing them. This is why being able to survey literature is important.
- It is a good practice to explicitly highlight a paper’s novel contributions in its text, and many journals require it.
- For something to be considered publishable, there has to be “enough novel findings”. Minor or incremental results are usually not enough by themselves. There is also a known bias against negative results (i.e. “We tried something, and it didn’t work”).
- At a certain level, it is unwise to talk too openly about your ongoing research because you run the risk of people taking your idea and executing on it faster than you. This is a big concern among academics, for whom getting papers published is important for their careers. It’s also a concern for industry researchers, for whom research is a nascent form of future company IP.

It is common for beginning researchers to fall into some kind of “novelty paralysis” where they have trouble finding open research problems, or even feel some anxiety about missing some critical prior work on the same problem they’re working on. This is something that a mentor can help with, but in the absence of that, the best advice I can give is to not worry too much and just do things. If you can solve most of a problem without being aware it has been solved already, it’s good practice and means you’re not too far from the people who solved it before.

As for checking prior work, you can never completely be sure some random Russian paper from the 60s already solved your problem. Ultimately, you can get confident enough that what you’re doing is novel by having a deep enough knowledge of the literature. For example, look for important papers that anyone implementing your idea would necessarily cite, and check the papers that cite it using literature search tools.

## Collaborating with other people

There is obviously a limit to how far one can go relying on their own skills, and for sufficiently ambitious projects, it will be necessary to work with people whose skills complement your own. Finding collaborators is difficult when starting out, especially when outside academia. 

The important thing to understand is that collaborations are built on *trust*. Researchers who decide to collaborate on a project do so because they have common interests and a good enough relation with one another. Asking strangers if they want to collaborate with you is unlikely to be successful, because from the other researchers’ perspective you are more likely to waste their time than anything else (and if you do get people willing to collaborate, they are probably as clueless as you).

In order to find mentors or collaborators as a beginning independent researcher, it is therefore important to *signal competence*, by showing that you are able to do interesting work mostly on your own. For example, writing blog posts that explain some experiments you did and analyze them is a signal that you have those skills. Discussing papers or problems in online communities is another. The point of this is to display to others that you already have some useful skills and can work autonomously. It is of course fine to ask for help, but you are much more likely to get help if people believe giving you a few pointers is enough.

A mistake I’ve seen in several instances is expecting to be held by the hand, or even to be able to pay people to review their work. This will not work and is a big signal that you are not mature enough to do research, hence not worth spending time on.

## Advice for people starting out

With all the previous sections in mind, I will try to outline a rough sequence of steps to doing ML research. This is to be taken as a template to adapt based on your own situation.

1. **Cultivate your skills:** Before even starting, it’s worth spending some time getting your basic ML skills up to snuff. Review math (especially Linear Algebra and Calculus), practice programming, do simple models, practice using LaTeX. The next step after that is reproducing papers that interest you. You should also spend time reading papers, and taking notes of their key ideas.
2. **Do small research projects:** When you’re comfortable implementing models and doing experiments from papers, it’s time to start experimenting beyond that. Don’t worry about novelty at this point. Just try to come up with ideas and implement them. Good examples would be small tweaks to an architecture, using a model on some dataset you care about… Small tasks that don’t take too much effort and with a short feedback loop. Get in the habit of taking notes of every idea you have and everything you do. Record what works and what doesn’t, and try to build a mental model of it. It’s a good idea to be part of some ML community where you can ask for pointers when stuck.
3. **Write blog posts:** Unless you find someone willing to mentor you, trying to do “proper” research on your own and publish a paper is too big of a hill to climb. Instead, consider working on small research tasks, writing them up into blog posts and sharing them with other people. Good projects for this would be small experiments to investigate a minor question, giving an intuition pump on something that people find confusing, small proofs of minor results… The target audience here should be other researchers or ML practitioners, so it’s fine to focus on a niche[^niche] topic and explain it well. The point of all this is to practice small research tasks with a short feedback loop while getting noticed by others. You also have the advantage of not being pressed to publish, so prioritize quality. If you consistently do good stuff, people *will* notice, and you might even get job offers. On that note, training models and putting them up online can count, but is better if you want your job to be making products rather than doing research.
4. **Collaborate:** After signalling your competence for long enough, you’ll find that all kinds of doors start opening to you, and you may be able to find people willing to collaborate with you on proper research projects. You should be ready at this point to try publishing a paper with the help of those collaborators. Depending on your background, you may also be able to get accepted into PhD positions.
5. **Continue:** Congratulations, you’re now a researcher. If you want to continue down that path, your main options are mostly getting into a PhD track, getting hired as a researcher in a private company, or seeking independent funding. I can’t make a general recommendation, since that will be highly dependent on your circumstances.

[^niche]: In fact, it is probably a good idea to go out of your way to do niche things, as that will make you stand out more. 

## Dos and Don'ts

- **Be genuine:** This means working on things you actually care about and are interested in, and not embellishing things. If you sound like a LinkedIn post, you will rightly be categorized as slop. (Part of following scientific norms is using scientific language). Another facet of this is identifying and building on the skills that are particular to you.
- **Understand what you’re doing:** It is very tempting to follow ideas based on vibes. This will typically lead to failure. If you have an idea, start by making it more precise, e.g. by reading up and checking what the terms you’re reading mean.
- **Be Truth-Seeking:** The point of science is to find “*true*” things. Since we cannot directly access truth, that means eliminating incorrect hypotheses. You should always be prepared to change your mental model if you find evidence that contradicts it. This means not letting yourself become too attached to your ideas.
- **Don’t be a crank:** A *crank* (or *crackpot*) is someone who tries to do research without understanding what they’re doing (often based on their misunderstanding of how things actually work), is overconfident in their bad ideas and gets upset when they get ignored by actual researchers. How to avoid that? Listen to feedback, don’t associate with cranks, and don’t post on vixra.

## Is it OK to use AI/LLMs for research?

It can be very tempting to use AI models to do parts of a research project (especially the ones you find difficult). This is generally not a good idea (with some exceptions), for several reasons. The first is that it is well-known that publicly available models are prone to hallucinating wrong answers to questions, and to flatter their users’ egos. This means that if you’re asking the AI for help with things you don’t understand, you run the risk of being bullshitted, or comforted in wrong ideas[^crank].

[^crank]: In extreme cases, this can turn you into a [crank](https://www.lesswrong.com/posts/2pkNCvBtK6G6FKoNn/so-you-think-you-ve-awoken-chatgpt).

AI is very effective to accelerate tasks you could do yourself. For instance, getting some code out without crawling for hours through bad documentation, or writing a quick LaTeX document template. I would strongly advise against relying on it for discussing ideas, however, as current LLMs are more likely to spout useless slop than anything valuable. If you can't verify the AI's work, don't use it.

The other problem with using AI is that in its current form, it is a *competitive technology*[^competitive] (as opposed to a *cooperative technology*). A competitive technology is a substitute for human effort at a given task that does not improve the user’s skill, whereas a cooperative technology does improve its user’s skill. To give a concrete example, using AI to vibe code something saves time, but doesn’t improve your programming skills (and in fact you might get worse at it if you start doing it less). In contrast, if you used the AI to get a basic skeleton of the code you want and edit it into the shape you want, you end up learning something.

[^competitive]: I swear I read about these in a blog post, but wasn’t able to find it again. Ping me on discord if you think you’ve found it.

Why this matters is that research skills depend on cognitive skills that only develop when actually doing things yourself. In addition, there are many domains where certain deep intuitions can only be obtained by actually working on some problems and exercises (this is particularly the case for math). In addition, while LLMs can solve many problems, they still struggle with many difficult ones, as well as "out of distribution" problems that don't come up often (if at all) in their training data. Such problems are common in research.

To give a video game analogy, AI is a spell that lets you clear low level mobs much faster, but you don’t get any XP, and it doesn’t work on higher level mobs. If you always use it, you won’t be able to tackle those higher level mobs, so you should spend some time grinding without it.

You might argue that you can just wait until AI improves enough to be able to handle those harder problems. While that is certainly a possibility, it means you are behind people who can do it using their own skills, and by following that argument to its conclusion, if the AI can do everything in your stead, what use are you?

## Miscellaneous Links

### Literature search

There are several websites that make it easy to search papers and browse the ones in their bibliography as well as the paper that cite them. This is useful to find relevant papers to read for a project, or to find if some idea has already been tried. This list isn’t exhaustive. It’s mostly the tools I’ve used enough to have an opinion about.

- **Semantic Scholar** (<https://www.semanticscholar.org/>) Good for searching papers (including finding the published version), their citation parents and children, as well as finding pdfs. You can also save papers to different libraries and get email updates with relevant papers, or update when specific authors publish new papers.
- **Citrus Search** (<https://citrus-search.com/#/>) Good for visualizing relevant papers starting from a small selection.
- **Perplexity** (<https://www.perplexity.ai/>) Good for searching sources from a semantic description. I use it when I can’t find what I’m looking for directly.

### Bibliography Management
- **Zotero** (<https://www.zotero.org/start>) is open source and lets you export a selection as bibtex entries (useful for managing bibliographies in LaTeX) and it will try to find freely available pdfs online for papers entered via their doi. I have gripes with it, but have yet to find anything better.

### Note Management and blog/paper writing
- **Overleaf** (<https://www.overleaf.com/>) is pretty much the go to online LaTeX editor for most people. It lets multiple people work on the same document (they recently started enshittifying their free tier, however). They have probably the best LaTeX documentation available.
- **VSCodium + LaTeX Workshop + LTeX+:** I generally prefer editing documents offline, so my go to is actually VSCodium with extensions for LaTeX and grammar checking. If you like Vim, you may want to see <https://github.com/gillescastel/latex-snippets>.
- **Obsidian** (<https://obsidian.md/>) or **Logseq** (<https://logseq.com/>). Both are quite similar and let you manage a collection of notes with reference links between them. The notes themselves are in Markdown with embedded LaTeX math support.
- **Blog writing:** There are plenty of options available. The “easiest” one which supports LaTeX via Markdown is hosting your blog on [Github Pages](https://pages.github.com/). There are plenty of static website generators like [Jekyll](https://jekyllrb.com/), [Hugo](https://gohugo.io/), … Pick your poison.

### Funding/Independent Science support

Here are various sources of support for independent research. I am not familiar with them, so I cannot give any comments.

- <https://www.independentscience.org/>
- <https://www.magnificentgrants.com/>
- <https://www.zfellows.com/>
- <https://experiment.com/grants/>
- <https://www.xprize.org/>
- <https://cimc.ai/#/proposals>
- <https://cosmosgrants.org/>
- <https://www.gap-map.org/?sort=rank>
- <https://igdore.org/>
- <https://onscienceandacademia.org/>
- <https://chillphysicsenjoyer.substack.com/p/a-big-board-of-open-sourceable-science>
- <https://euclia.vercel.app/>

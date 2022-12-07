---
layout: post
title: "How my applied math studies prepared me for Machine Learning"
use_math: false
tags: [Math,Machine Learning,Pedagogical]
---

I have had multiple encounters now with people interested or working in Machine Learning/AI Alignment, who wish they had more mathematical background. Most of them come from a Computer Science background, which is not surprising. Despite Machine Learning often being done in CS departments, the typical CS undergrad curriculum contains much less math than what one can find in some ML papers. In my experience, CS people struggle the most with probability and statistics, despite those being an integral part of modern ML (GPT-style models and Diffusion models are both inherently probabilistic, for example).

While not being a real ML researcher, or even practitioner myself, I've been closely following ML advances in my domains of interests, and I rarely had any trouble with the math in papers I read. I think this is in large part due to my education as an applied mathematician providing me with a solid foundation.

The goal of this post is to examine in detail the various courses I had as an undergrad, and why I think they were useful for getting into ML. It's partially meant as a very rough guide for CS people looking to pick more math to learn, but I wouldn't necessarily advocate for people to go exactly the same things as I did, as I picked my courses according to my own interests.

What I *would* advocate for is going a little further than the bare minimum that is actually relevant for Machine Learning. There are many things in math that are understood and appreciated more profoundly after going through more advanced stuff. What you gain there is intuition.

## Summary

I studied in Europe, where the educational system is slightly different than in the US. My studies consisted of three years of Bachelor (hereafter denoted B1, B2 and B3), and two years of Masters (M1 and M2). Master studies in my university have various specialization (e.g. Research, Education, Industry, Data Science). My first Master was in the research specialization. After M2, I did another year with just the courses from the Data-Science specialization. I won't talk about those because there's not many of them, and they don't bring much math.

While my degree just says "Mathematics", it's really *Applied Mathematics*, and this is clear from looking at the various courses I had, with most of them falling into one of the following categories
- Dynamical Systems
- Scientific Programming and Numerical Analysis
- Probability and Statistics

Here's a list of the most important courses I took. I've skipped most of the irrelevant ones, and highlighted in **bold** those I think are worth learning for ML.

## Analysis

- **Real Analysis** (B1) Two courses covering two semesters. They're pretty much your standard fare first year analysis courses, meant both to challenge students and introduce many key ideas that will be used all over the rest of the curriculum.
- Complex Analysis (B2) Analysis, but with complex numbers. While it's beautiful mathematics, it's mostly unimportant for ML aside for a few niches.
- **General Topology** (B2) Sometimes, we want to talk about the convergence of things that aren't real numbers, or that don't even have a distance function on them. This is what this course is about. While more abstract, it brings many useful ideas to one's vocabulary.
- **Functional Analysis** (B3) Also known as *infinite dimensional linear algebra + topology*. Kinda useful for certain niches in ML (e.g. Kernel methods[^kernel] or [NTKs](https://arxiv.org/abs/1806.07572))
- **Measure Theory** (B3) The classical theory of integration seen in a first year calculus course has several problems. This is the big boy course about how to define a general theory of what it means to take integrals, and the bedrock for probability theory.

[^kernel]: lmao

## Programming and Numerical Analysis

- **Linear Algebra 1** (B1) and **2** (B2) All about vector spaces and operations on them. The first course was more theoretical, while the second was more hands-on and numerical, with algorithms like the power method (in Matlab). Linalg is not only relevant to ML, but to pretty much all of math and science, so having a good understanding of it is very useful.
- **Numerical Analysis** (B3) The first leg of the Numerical Trinity. It covers topics like function approximation and numerical quadrature.
- **Optimization** (B3) Mostly differentiable optimization. Covers basics like Gradient Descent, Newton, BFGS and conditioning. Understanding how these algorithms work on simple cases is useful when using solvers to train massive neural nets.
- **Algorithms** (B3) Covers more numerical analysis (ODE solvers) as well as some algorithm design strategies (branch and bound, divide and conquer, backtracking, ...) The ODE solvers part is useful for Diffusion Models.
- **Numerical Linear Algebra** (M1) Solving linear systems is one of the most common problems in science. Doing it efficiently takes both a good understanding of linear algebra and an algorithmic mindset. 
- Functional and Logic Programming (M1) Haskell and Prolog. Functional Programming is useful to learn in general, and of course is the paradigm used in frameworks like Jax.

All of this was served with a copious side of programming[^programming] in various languages (mostly C[^clang], Matlab, and a bit of Fortran).

[^programming]: As an aside, I probably had more programming in my curriculum than the actual CS students at my university.
[^clang]: In fact this was one of the reasons that made me choose my university.

## Probability and Statistics

- Introduction to Probability (B1) Baby's first course on probability.
- **Statistics** (B2) Standard Frequentist™ Statistics. Much of the language in ML comes from there (e.g. Maximum Likelihood, Variance-Bias tradeoff, Estimators, ...)
- **Linear Regression** (B2) One of the most basic regression models, but it can still fall prey to common problems like overfitting. It's also just Linear Algebra.
- **Probability** (B3) The Big boy probability course based on Measure Theory.
- **Multivariate Analysis** (M1) A second statistics course focused on getting hands-on experience with some basic statistical models (e.g. logistic regression, ANOVA, k-means, ...)
- **Advanced Statistics** (M1) Cool statistics stuff, including Lasso regression, cross-validation, covariance matrix estimation and statistics in function spaces.

## Dynamical Systems

- **Ordinary Differential Equations** (B2) Useful for [Neural ODEs](https://arxiv.org/abs/1806.07366), but arguably the largest amount of value comes from basic dynamical system theory.
- Lagrangian Mechanics (B2) Like Complex Analysis, it's beautiful mathematics, but not super relevant for ML.
- Mathematical Modelling (B2) Some qualitative dynamical system theory. Kinda redundant with the Master's course.
- Hamiltonian Mechanics (B3) Same comment as for Lagrangian Mechanics, although there's an [interesting](http://arxiv.org/abs/1905.07436) [line of](http://arxiv.org/abs/2004.06840) [research](http://arxiv.org/abs/2002.12493) studying momentum optimizers with it.
- Partial Differential Equations (B3) Differential-er Equations. Unless you're [directly working on it with ML](https://arxiv.org/abs/2108.08481), it's not super relevant.
- **Qualitative Theory of Dynamical Systems** (M1) Essentially the content of Steven Strogatz's Book/course. The main value for ML is that *everything* is a dynamical system if you look close enough, especially optimization processes.
- **Control Systems** (M1) A staple of Engineering. It covers a lot of the same problems as e.g. RL. See [Structured State Spaces](https://arxiv.org/abs/2111.00396) for an example of the language of Control theory in ML.
- **Koopman Theory** (M1) This is a niche part of dynamical systems theory that has had a revival in the last few years as a [data-driven approach for dynamical systems](https://nicholasgeneva.com/deep-learning/koopman/dynamics/2020/05/30/intro-to-koopman.html). There's [an](https://www.nature.com/articles/s41467-018-07210-0) [entire](https://arxiv.org/abs/1708.06850) [cottage](http://koopman.csail.mit.edu/) [industry](http://arxiv.org/abs/2006.02361) using it in ML/DL.
- Operator Semigroups (M1) The big brain approach to PDEs. Same comment.
- **Chaos Theory** (M2) Historically, chaotic systems are one of the first examples of systems whose behavior can't be predicted well or described as a sum of parts. There are [a](http://arxiv.org/abs/1606.05336) [few](http://arxiv.org/abs/1606.05340) [papers](http://arxiv.org/abs/1909.05176) linking Deep Learning and Chaos Theory.

## Miscellaneous courses

- **Differential Geometry** (B2) and Cosmology (M1) Beautiful mathematics and physics aside, the language of Differential Geometry pops up here and there in ML. It's where the word *manifold* comes from.
- Astronomy (B2) Okay, I'm mostly flexing with this one, but we have had a couple of masters thesis projects applying ML to astronomical data.
- **Graph Theory** (B2) and **Network Science** (M2) A little Graph Theory/Network Science goes a long way. Besides [GNNs](https://arxiv.org/abs/1812.08434), it can provide intuitions about matrices.
- Algebra and Geometry (B1) and Higher Algebra (B2) [Some elementary abstract algebra](https://www.eleuther.ai/beginners.pdf) is necessary for Linalg. Other than that, see [Geometric Deep Learning](https://geometricdeeplearning.com/).
- Philosophy of Science (B1) and Formal Logic (B2) This one might seem far-fetched, but remember that *Science is not an assembly line job*. If you're not asking questions about what it is exactly that you're doing and why every once in a while, *you're doing it wrong*. Logic is just good and fun (especially since that course was about *non-classical logic*).[^phil] 

[^phil]: I also had courses on the Philosophy of mathematics and Foundations of mathematics that I could throw in there for good measure.

## Concluding remarks

Through my curriculum, I learned about a broad variety of subjects that provide useful ideas and intuitions when applied to ML. Arguably the most valuable thing I got out of it is a *rough map* of mathematics that I can use to navigate and learn more advanced topics on my own.

Having already been exposed to these ideas, I wasn't confused when I encountered them in ML papers. Rather, I could leverage them to get intuition about the ML part.

Strictly speaking, the only math that is actually needed for ML is real analysis, linear algebra, probability and optimization. And even there, your mileage may vary. Everything else is helpful, because it provides additional language and intuition. But if you're trying to tackle hard problems like alignment or *actually getting a grasp on what large neural nets actually do*, you need all the intuition you can get. If you're already confused about the simple cases, you have no hope of deconfusing the complex ones.
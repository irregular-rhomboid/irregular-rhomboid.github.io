---
layout: post
title: "Further mathematical posters"
tags: [Math, Art]
---

After making the computer room posters last year, I suggested to my department to make some for our coffee room. Just like the first time, this post is to document the creative choices made.

## Context

Unlike the previous time, where I took it upon myself to decorate a classroom without asking for permission, this time I made the proposal at a department meeting to make posters for our coffee room. The idea was to make portraits of mathematicians representing the various disciplines of the department, and the first step was having everyone vote on what people they wanted. 

I ended up with more names than I could make posters for, and picked the most popular ones that appealed to me. For the posters, I followed basically the same principles as last time. The one new addition was to add a quote from each subject at the bottom. The systematic use of gray scale and distortion on the base pictures has a slightly different meaning here. It's partly to hide defects or edits, but symbolically it also represents how what we know of them as people gets distorted over time, while their ideas are still alive (which is why they're in color).

## Leonhard Euler


The first poster I made was Leonhard Euler. I had the idea of taking a grayscale portrait of him and replacing each pixel by a digit of Euler's number (of which I happen to have a [file with thousands of digits](https://www.gutenberg.org/ebooks/63) downloaded from Project Gutenberg years ago). This ended up looking pretty good, and for the overlays, I put the [OG Königsberg graph](https://en.wikipedia.org/wiki/Seven_Bridges_of_K%C3%B6nigsberg), Euler's polyhedron formula and Euler's identity. Add one of his quotes at the bottom, and done. Easy Peasy.

![](/assets/img/posters/poster_euler.png)

## Henri Poincaré

The other posters were not as easy, and I spent a while not working actively on these, until I got the time and inspiration a week ago. The second poster I made was Henri Poincaré. I initially wanted to draw something like a phase diagram around his glasses and have a three-body problem orbit just lying around. It looked pretty goofy, so I went back to the drawing board. 

After talking to some colleagues working in Celestial Dynamics, I learned of [*star-hopping planets*](https://planetplanet.net/2022/02/24/star-hoppers-planets-bouncing-between-binary-stars/), and decided to use that for the eyes. The base image was modified using the algorithm from [this paper](https://arxiv.org/abs/1504.02010), and I then added the [Euler-Poincaré formula](https://en.wikipedia.org/wiki/Euler_characteristic) and a picture of the [Poincaré disk](https://en.wikipedia.org/wiki/Poincar%C3%A9_disk_model), in order to highlight his contributions to Algebraic Topology and Hyperbolic Geometry, respectively.

Both for Poincaré and Euler, the placement of the overlays has some signification. In particular, their eyes are covered because Poincaré famously had very poor eye-sight, and Euler eventually became blind, which didn't prevent either of them to do mathematics. The disk on Poincaré is placed roughly where a flower would be in a breast pocket.

![](/assets/img/posters/poster_poincare.png)

## Emmy Noether

This was the most difficult poster to conceptualize. I wanted to evoke visually the idea of groups and symmetry, while mentioning Noether's most famous contributions, such as [Noether's theorem](https://en.wikipedia.org/wiki/Noether%27s_theorem). For the overlays, I was a bit lazy, and used a condensed version of Noether's theorem, and commutative diagrams for group representations and the [first isomorphism theorem](https://en.wikipedia.org/wiki/Isomorphism_theorems). 

After making a symmetrized version of her bust (like face cards in poker) and tiling it and scaling it, I remembered tilings of the hyperbolic plane exist and come from a group action and found [this nice website](https://www.malinc.se/m/ImageTiling.php) after a quick search. Symbolically, this directly represents the idea of groups and symmetries, and the use of the hyperbolic space means there are in principle infinitely many copies of Emmy Noether in the picture, which represents how far the influence of her work on modern mathematics goes, without being necessarily known and pairs well with the choice of quote at the bottom.

![](/assets/img/posters/emmy-noether.png)

## Claude and Betty Shannon

This one is probably my favorite of the four. While reading up on Shannon, I heard of his wife [Betty](https://en.wikipedia.org/wiki/Betty_Shannon), and found their story too interesting to pass up. I took their portraits from Wikipedia and removed the backgrounds to replace it with a radial gradient. Symbolically, this is a "spotlight", which is mostly on Claude, but shifted a bit towards Betty, whose role as main collaborator of Claude is usually not mentioned. On top of that, I used the dithering algorithm from [this post](https://liamappelbe.medium.com/dizzy-dithering-2ae76dbceba1), which I had implemented a while ago, and found thematically fitting for Shannon, as from afar it looks like a normal picture, but up close it looks like random noise, thereby illustrating Shannon's most famous ideas.

The overlays were quite simple. I slapped the formula for entropy on Claude's head, and took a diagram from his [master thesis](https://www.cs.virginia.edu/~evans/greatworks/shannon38.pdf) and the layout of the Theseus Maze. Looking up quotes from Claude turned some [wildly prescient predictions](https://en.wikiquote.org/wiki/Claude_Elwood_Shannon).

![](/assets/img/posters/poster_shannons.png)


## Conclusion

I'm pretty happy with how these posters came out overall, and how they cover most of the topics studied in my department. 

You can find pdfs of the posters [here](https://github.com/irregular-rhomboid/computer-room).
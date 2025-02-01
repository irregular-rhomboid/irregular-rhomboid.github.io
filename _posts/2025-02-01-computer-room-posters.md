---
layout: post
title: "I made posters for a computer room. This is what went into them."
use_math: false
tags: [Math, Art]
---

During the holidays I worked on a small project to make posters for a computer room in my university. Since this was essentially an exercise in artistic creativity, I thought I'd document the process of making these, as I think this is often omitted despite being (for me, at least) the most interesting part of the creative process.

![](/assets/img/posters/computer-room.jpg)

## Context

The math department I work at moved to a new building a few years ago and along with it the classrooms. Because we're more of an applied math department, there is a lot more focus on programming and numerical analysis in the curriculum, hence a lot of time in the computer room. Since I happen to TA a lot of these course, that means I end up spending a lot of time in this underground computer room with ugly concrete walls. It wasn't long before I started getting the urge to make it more tolerable.

The initial idea was rather simple. I thought it would be funny if there was a portrait of John von Neumann silently judging the students for inadequate use of pseudorandom numbers. From there I thought it would be nice to highlight mathematicians that were influential in computer science. I also wanted to highlight female mathematicians, as we have quite a lot of female students who don't especially enjoy programming and I wanted to remind them of the place women have had in computer science from the beginning.

## Ada Lovelace

![](/assets/img/posters/poster_ada_small.png)

The obvious first pick for "female mathematician who contributed to computer science" was [Ada Lovelace](https://en.wikipedia.org/wiki/Ada_Lovelace), and she ended up being the first poster I made. I chose a [portrait](https://en.wikipedia.org/wiki/Ada_Lovelace#/media/File:Ada_Lovelace.jpg) of her that I found was striking and that isn't the most commonly used, and turned it to grayscale in order to match the other pictures I had. I wanted to further modify the picture to make it look like [Jacquard weave](https://en.wikipedia.org/wiki/Jacquard_machine), as a nod to the proto-computing technology of her time. After thinking about how to achieve this with code, I ended up using the Newspaper filter from GIMP to achieve the desired effect. To add some color, I took diagrams of [Babbage's analytical engine](https://en.wikipedia.org/wiki/Analytical_engine) and the table describing the program to compute Bernoulli numbers from her [note](https://web.archive.org/web/20080915134651/http://www.fourmilab.ch/babbage/sketch.html) on the engine. I finished by adding a band at the bottom with a short text about her life.

I ended up using the choices made on this first poster as a template for the other ones.

## Alan Turing

![](/assets/img/posters/poster_turing_small.png)

The other obvious choice for this project was [Alan Turing](https://en.wikipedia.org/wiki/Alan_Turing). Making the image for him turned out to take the most effort out of all the posters. I wanted to use [Turing patterns](https://en.wikipedia.org/wiki/Reaction%E2%80%93diffusion_system), which are a mechanism proposed by Turing towards the end of his life to explain the patterns found on animal skin and fur. I used the [Gray-Scott model](https://visualpde.com/nonlinear-physics/gray-scott.html) and experimented with its parameters to obtain an image where the density of the patterns follow the shade in the original picture. What ended up doing the trick was feeding the base image as a space dependent kill rate in the equations, and simulating them for a very long time. It actually took so long that I ported my code to run on GPU to make it faster. I didn't spend a lot of time tweaking the base image to kill rate mapping, but past a certain threshold where the image is dark enough the system just locally stays at a fixed point, which means darker parts of the images like the eyes stay remain preserved. For the colored overlays, I took a diagram of the [Colossus computer](https://en.wikipedia.org/wiki/Colossus_computer) and a description of a Turing machine from Turing's original paper.

## Margaret Hamilton

![](/assets/img/posters/poster_hamilton_small.png)

As the second female mathematician and programmer for this project, I chose [Margaret Hamilton](https://en.wikipedia.org/wiki/Margaret_Hamilton_(software_engineer)). I already really liked the [famous picture](https://en.wikipedia.org/wiki/Margaret_Hamilton_(software_engineer)#/media/File:Margaret_Hamilton_-_restoration.jpg) of her standing next to the printed source code she and her team wrote for the Apollo Program, to which I applied a dithering filter using the [DitherPunk.jl](https://juliaimages.org/DitherPunk.jl/stable/) package. For the overlays I took a piece of the [Apollo's Command Module source code](https://github.com/chrislgarry/Apollo-11/tree/master) and a diagram of the console in the Apollo 11 Lunar Module.

## John von Neumann

![](/assets/img/posters/poster_von-neumann_small.png)

Last but not least, [John von Neumann](https://en.wikipedia.org/wiki/John_von_Neumann). I had less inspiration with this poster, and ended up using another filter from DitherPunk.jl. The final picture is composed of somewhat large pieces that evoke [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) to me (which is relevant since von Neumann founded the field of cellular automata). For the overlays, I used a diagram from one of his papers and a schematic of an [ENIAC program to solve differential equations](http://ds-wordpress.haverford.edu/bitbybit/bit-by-bit-contents/chapter-seven/7-5-assembly-language-programming-2/). Because the dots that make him up are larger, I put the poster in the opposite corner of the entrance, for maximum effect.

## Bringing it all together

I will finish this short post by commenting on the broad similarities between all of these posters and the overarching themes. First the use of black and white for all the portraits references the importance of binary representation as the fundamental logical building block of modern computers. This is reinforced by the use of dithering for the Hamilton and von Neumann posters, as the only colors used are black and white. This and the distortions used in the other poster serve another purpose. Viewed from a distance, the posters look like normal pictures but as the beholder gets closer they see new detail appear, inviting them to take a closer look, and eventually find the short texts at the bottom of each poster to learn more about the people being portrayed (and possibly be tempted to look them up further).

This use of visual trickery carries another important idea: that of emergence of complex behavior from simple rules, which is arguably one of the more important ideas in computing and mathematics and is best exemplified by the chemical reactions used to obtain Turing's portrait, and the nod to cellular automata in the von Neumann poster.

The number two is present in other parts of the set of posters. There are four posters, two females and two males. There are two overlays of complementary colors (orange-teal and green-pink) on each poster, which again come in male-female pairs. Finally, for each poster, the overlays represent the two complementary aspects of computing: hardware and software. Finally, on each poster at least one of the overlays runs into the border of the page, implying that it continues beyond it. This symbolizes the lasting influences each of the people portrayed have had on computer science, as their ideas escape the frame of the poster.

## Closing words

Overall I'm pretty happy with how these turned out. That computer room immediately looked more inviting after I put them up. While writing this post, I could see some details I'm slightly less satisfied about, but enough to modify them.

For those interested, I put up the pdf of the posters, along with the code I used [here](https://github.com/irregular-rhomboid/computer-room).
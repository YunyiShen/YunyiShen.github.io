---
title: "Detecting Flares using TESS Mission's Photometric Data of M-Dwarfs"
collection: research
permalink: /research/2021-Flare
excerpt: 'A Timeseries Model with (quasi-periodic) Gaussian Process Trend and Hidden Markov Firing'
date: 2021-06-17
venue: 'Vianey Leos-Barajas and Gwendolyn Eadie, University of Toronto'
---

## Background

Our sun sometimes has sudden flash of increased brightness called [Solar Flares](https://en.wikipedia.org/wiki/Solar_flare). This happens also in much smaller stars called [M-dwarfs](https://en.wikipedia.org/wiki/Red_dwarf), which have 0.1-0.3 mass of our sun and many are orbited by exoplanets. We would really want to know the effect of flares to those planets but before that, we have to be able to find flares. 

[Transiting Exoplanet Survey Satellite](https://en.wikipedia.org/wiki/Transiting_Exoplanet_Survey_Satellite) (TESS) mission offered us a great opportunity to study flear events though the primary mission of TESS is to search for exoplanet. It collects thousands star's brigntness change so that we could identify the flares of those stars from the time series. 

There are two main differences between an exoplant transit and flare,
- Transit is a drop of brightness while flare is a sudden increase of brightness
- Transits has clear periodicity while flares happens effectively at random

We can still argue the first difference does not prevent us from using method in searching exoplant (by taking negative). However, the second problem is more severe because we cannot make use of periodic functions. Beside that, star's brightness has its own period we have to distinguish. To "detrend" the data, people make use of a special kind of quasi-periodic Gaussian process called *Celerite* which has clear physical motivation.

Then one can use 3-sigma rule after the detrending to find flares, whose sensitivity and specificity can both be bad since 1) detrending process can fit small flares that reduce 2) there can have sudden noise. So we want a better method.

## Method 

We still want to detrend the time series while propagate the uncertainty, and account for the random nature of flares. We built a Hidden Markov model with three state on top of a Celerite, namely **Q**uiet, **F**iring and **D**ecay (QFD model) to model the flare, while in **Q** state, the detrended brightness follow normal distribution; in **F** state, the brightness follow a exponentially modified normal random walk from the previous brightness; and in **D** state, the brightness follwed a AR(1) with slope less than 1 of the previous state this impose an on average exponential decay. Toghther with Celerite as a hidden trend variable, we have a model that detrend and detect flares simultaneously. 

The model was implemented in stan, and hosted on [Github](https://github.com/YunyiShen/AstroHMMs). It is still under development.

## Results

We show one result detection from star TIC 131799991

![](http://YunyiShen.github.io/files/Research_figs/FlareDet/det.png)


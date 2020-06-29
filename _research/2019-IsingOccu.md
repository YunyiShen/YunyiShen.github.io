---
title: "Spatial Explicit Multi-specific Occupancy Modeling"
collection: research
permalink: /research/2019-IsingOccu
excerpt: 'Spatial explicit multi-specific occupancy model and its application on the Apostle Island National Lakeshore'
date: 2018-09-02
venue: 'Tim Van Deelen, University of Wisconsin-Madison'
#paperurl: 'https://doi.org/10.17520/biods.2018246'
#citation: 'Yu, J., Shen, Y., Song, X., Chen, X., Li, S., & Shen, X. (2019). Evaluating the effectiveness of functional zones for black muntjac (Muntiacus crinifrons) protection in qianjiangyuan national park pilot site. Biodiversity Science, 27(1).'
---

## Background
Drivers of distributions of species and community structures are among the most important questions in ecology. Recent research suggested that communities reflect both species- and patch-level drivers, i.e . neither species nor sites were exchangeable. Thus Modelers should model different processes explicitly to understand their relative importance. A general framework for modeling systems with unspecified dependence structures (e.g. competition between species, spatial auto-correlation between sites) is Probabilistic Graph Modeling (PGMs). Markov Random Field modeling (MRF) is a kind of PGM that defines joint distributions of sets of random variables linked by non-directed graphics which allow cycles . MRF has long been used to model spatial correlations in ecology and agriculture, e.g. in spatial ecology, as well as temporal analysis and interspecific interactions. It was also widely used for modeling networks in social systems, genetic associations, as well as competing species.

Due to a recent flourish of camera-trapping research, ecologists now can get vast amounts of detection-nondetection data which can be used to infer presence-absence (P/A) of moderate to large-sized animals. However, imperfect detection remains a challenge. Occupancy modeling addresses imperfect detection and infers true P/A and detection rates from repeat sampling. This idea was also explored by computer vision and image modeling communities earlier, especially after the development of the EM (Expectation-Maximization) algorithm which allows maximum likelihood estimation when models depend on unobserved latent variables (e.g. true occupancy). MRF with imperfect observations were also explored in this context. We can build various occupancy-like models based on the idea that observations are treated as samples taken from  detection distributions conditioned on unobserved latent true patterns that follow other characteristic distributions.

The objective of this study was to develop a model that can capture spatial auto-correlation and interspecific interactions while controlling for environmental predictors and, consequently, understanding the drivers of distributions of competing species pairs in the Apostle Islands National Lakeshore (APIS, Wisconsin, USA). We focused on 4 species (two pairs), Fisher-Marten and Coyote-Fox:

![](http://YunyiShen.github.io/files/Research_figs/APIS/4spp_map.png)


## The Model

We used a auto-logistic model for both spatial auto-correlation and interspecific associations in occupancy. To account for imperfect detection, we used another auto-logistic model to model the detection process condition on occupancy. Species can be detected and interact with other species only if they occupy certain site.

To fit such a model, we used a special MCMC algorithm for doubly intractable distributions developed by Murray et al. 2008. The missing true occupancy status was sampled via a Gibbs sampler.

Simulation showed the algorithm worked pretty well in terms of constructing the network for two species:

![](http://YunyiShen.github.io/files/Research_figs/APIS/bigsimulation_temp.png)


We used the negative potential function to evaluate contribution of each driver.

## Some finding

Data supported mainland-island rather than stepping-stone model for spatial auto-correlation, We detected a significant positive distance dependency in fisher (2.479,CI=[0.976,4.744]) and a negative distance dependency in marten's occupancy (-0.789,CI=[-1.907,-0.0558]). However, we did not detect significant association between these species in both occupancy and detection ($CI=[-0.215,0.393]$, $[-0.326, 0.322]$). Marten showed a intra-island spatial auto-correlation $0.260$ $CI=[0.0551,0.444]$). These findings support hypothesis that, **instead of competition, the partition pattern of fisher and marten was better explained by flipped mainland-island process (i.e. disperse from island to mainland)**.

Negative potential function showed again that association has no significant contribution to the distribution pattern of FM system. FM system seemed to be dispersal/environment driven for fisher, while dispersal/environment had similar level of contribution with intra-island spatial auto-correlation for marten.

![](http://YunyiShen.github.io/files/Research_figs/APIS/negH_FM_env.jpg)

For coyote and fox, we detected a significant positive distance dependency in fox but not coyote (Coyote: 0.552,CI=[-0.378,1.69] Fox: 2.41,CI=[0.428,6.30]). Meanwhile, posterior association in occupancy was estimated positive (0.234,CI=[-0.041,0.53]). These findings suggest that on top of dispersion/environment, **we have some evidence that there exist a positive association between two species that need further evaluation**.

Similar to the FM system, dispersal/environment was also driving the CF system, in the contrast, spatial auto-correlation and interspecific interaction seem to be important also. Note that we detected a significant positive association in 60 days scale in detection may due to some behavioral interaction between them.

![](http://YunyiShen.github.io/files/Research_figs/APIS/negH_CF_env.jpg)

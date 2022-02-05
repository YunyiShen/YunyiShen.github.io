---
title: "linconGaussR"
collection: software
excerpt: "Sampling multivariate Gaussian under linear constraints"
type: "Package"
permalink: /software/linconGaussR
venue: "CRAN"
date: 2021-10-01
---

Header only R implementation of 

Gessner, Alexandra, Oindrila Kanjilal, and Philipp Hennig. "Integrals over Gaussians under linear domain constraints." International Conference on Artificial Intelligence and Statistics. PMLR, 2020.[download](https://proceedings.mlr.press/v108/gessner20a.html).

The original Python implementation can be found [here](https://github.com/alpiges/LinConGauss)


The package is on CRAN, to install it, use:

```r
install.packages("linconGaussR")
```

To install from Github: 

```r
devtools::install_github("YunyiShen/linconGaussR")
```

This package was written as header-only, with all the sampling method/classes used in the `inst/include` directory. If you just wish to use the C++ API of this implementation, consider install this package, and add `linconGaussR` (for sure `RcppArmadillo` and `Rcpp`) to your `LinkingTo` field of the description. The main sampling function is `linconGaussR::linconGauss_cpp`. Below is a sample implementation calling this method only:

```c
// [[Rcpp::depends(RcppArmadillo)]]
#include <linconGaussR.h>// we call RcppArmadillo

using namespace Rcpp;
using namespace arma;
using namespace std;
using namespace linconGaussR;


//[[Rcpp::export]]
arma::mat linconGauss_cpp(int n, // sample size
                            arma::mat A, // linear constraint
                            arma::vec b, // offset of the linear constraint, so that Ax+b>0
                            arma::mat Sigma, // covariance
                            arma::vec mu, // mean
                            arma::vec x_init, // an initial value, necessary
                            bool intersection=true, // whether to sample from the intersection (otherwise from the union)
                            int nskp=5){ // number of sample to skip during iterations
    return linconGaussR::linconGauss_cpp(n,A,b,Sigma,mu,x_init,intersection,nskp);
}

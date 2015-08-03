#' Targeted Maximum Likelihood Estimation for Networks
#'
#' The \pkg{tmlenet} R package implements the Targeted Maximum Likelihood Estimation (TMLE) of causal effects 
#' under single time point stochastic interventions in network data. 
#' The package also implements the Horvitz-Thompson estimator for networks and the parametric g-computation formula-based estimator. 
#' The inference for the TMLE is based on the efficient influence curves for dependent data.
#' For additional details and examples please see the function-specific documentation.
#'
# @section Documentation:
# \itemize{
# \item To see the package vignette use: \code{vignette("tmlenet_vignette", package="tmlenet")} 
# \item To see all available package documentation use: \code{help(package = 'tmlenet')}
# }
#'
#' @section Routines:
#' The following routines will be generally invoked by a user, in the same order as presented below.
#' \describe{

#' \item{\code{\link{def.sW}}}{Defines baseline summary measures \code{sW} that are functions of each unit's baseline covariate values 
#' in \code{Wnodes} as well as unit's network baseline covariate values in \code{Wnodes} (\code{Wnode} values of units friends).
#' This is the first part of the two part specification of the structural equation model for the outcome \code{Y}.
#' The function \code{def.sW} can take any number of arguments, with each argument specifying either a vector of summary measures for all units 
#' or a multivariate summary measure in a form of a matrix.
#' Each argument to \code{def.sW} must be named and has to be a valid R expression or a string containing an R expression. 
#' The expressions can contain double bracket indexing to reference variable values of friends. For example,
#' \code{Var[[1]]} produces a summary measure that is a vector of length \code{nrow(data)} that contains the values of \code{Var} variable of 
#' each unit's first friend. One could also use vectors for indexing friends, using a special constant \code{Kmax} to represent the largest number of friends for any unit.
#' For example, \code{Var[[1:Kmax]]} produces a summary measure that is a matrix of dimension with nrow(data) rows and Kmax columns, 
#' where the first column will be equal to \code{Var[[1]]}, and so on, up to the last column being equal to \code{Var[[Kmax]]}. Note that \code{Kmax} can vary depending 
#' on a particular dataset and is determined by the input network structure. That is \code{Kmax} is the largest node degree observed among all observations. 
#' By default, \code{NA} is used for the missing network summary measure values, however \code{NA}'s can be automatically replaced with 0's 
#' by passing \code{replaceNAw0 = TRUE} as an argument to \code{def.sW} function.}

#' \item{\code{\link{def.sA}}}{Defines treatment summary measures \code{sA} that can be functions of each unit's exposure & baseline covariates, 
#' as well the exposures and baseline covariates of unit's friends. 
#' This is the second part of the two part specification of the structural equation model for the outcome \code{Y}. 
#' The syntax is identical to \code{def.sW} function except that \code{def.sA} can consist of summary measures that are function of \code{Wnodes} 
#' and \code{Anode}.}

#' \item{\code{\link{tmlenet}}}{Performs estimation of the causal effect of interest using the observed input \code{data}, 
#' the intervention of interest, the network information and the previously defined summary measures \code{sW}, \code{sA}.}

#' \item{\code{\link{eval.summaries}}}{A convenience function that evaluates the previously defined summary measures 
#' \code{sA} and \code{sW} applied to the observed \code{data}, which can then be checked by user.}

#' }
#' 
#' @section Data structures:
#' TBD.
# The following most common types of output are produced by the package:
# \itemize{
# \item \emph{parameterized causal \code{DAG} model} - object that specifies the structural equation model, along with interventions and the causal target parameter of interest.
# \item \emph{observed data} - data simulated from the (pre-intervention) distribution specified by the structural equation model.
# \item \emph{full data} - data simulated from one or more post-intervention distributions defined by actions on the structural equation model.
# \item \emph{causal target parameter} - the true value of the causal target parameter evaluated with full data. 
# }
#'
#' @section Updates:
#' Check for updates and report bugs at \url{http://github.com/osofr/tmlenet}.
#'
#' @docType package
#' @name tmlenet-package
#'
NULL
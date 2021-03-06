% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary.R
\name{iNZightSummary}
\alias{iNZightSummary}
\title{Informative Summary Information for Regression Models}
\usage{
iNZightSummary(
  x,
  method = "standard",
  reorder.factors = FALSE,
  digits = max(3, getOption("digits") - 3),
  symbolic.cor = x$symbolic.cor,
  signif.stars = getOption("show.signif.stars"),
  exclude = NULL,
  exponentiate.ci = FALSE,
  ...
)
}
\arguments{
\item{x}{an object of class \code{"lm"}, \code{"glm"} or \code{"svyglm"},
usually the result of a call to the corresponding function.}

\item{method}{one of either \code{"standard"} or \code{"bootstrap"}. If
\code{"bootstrap"}, then bootstrapped estimates and standard errors
are calculated; otherwise, uses the standard estimates.}

\item{reorder.factors}{logical, if \code{TRUE}, and there are factors present in the model,
then the most common level of the factor is set to be the baseline.}

\item{digits}{the number of significant digits to use when printing.}

\item{symbolic.cor}{logical, if \code{TRUE}, print the correlations in a symbolic form
(see \code{\link{symnum}}), rather than as numbers.}

\item{signif.stars}{logical, if \code{TRUE}, \sQuote{significance stars} are printed for
each coefficient.}

\item{exclude}{a character vector of names of variables to be excluded from the
summary output (i.e., confounding variables).}

\item{exponentiate.ci}{logical, if \code{TRUE}, the exponential of the
confidence intervals will be printed if appropriate (log/logit link or log
transformed response)}

\item{...}{further arguments passed to and from other methods.}
}
\value{
An object of class \code{summary.lm}, \code{summary.glm}, or
\code{summary.svyglm}.
}
\description{
The iNZight summary improves upon the base R summary output for
fitted regression models. More information is provided and displayed
in a more intuitive format. This function both creates and returns a
summary object, as well as printing it.
}
\details{
This summary function provides more information in the following ways:

Factor headers are now given. The base level for a factor is also
listed with an estimate of 0. This is to make it clear what the base
level of a factor is, rather than attempting to work out by deduction
from what has already been printed.

The p-value of a factor is now given; this is the output from
\code{\link[car]{Anova}}, which calculates the p-value based off of
Type III sums of squares, rather than sequentially as done by
\code{\link{anova}}.

Each level of a factor is indented by 2 characters for its label and
its p-value to distinguish between a factor, and levels of a factor.

The labels for each level of an interaction are now just the levels of
the factor (separated by a \code{.}), rather than being prepended with
the factor name also.
}
\note{
If any level is not observed in a factor, no p-values will be printed
on all factors. This is because we cannot calculate Type III sums of
squares when this is the case.

The fitted model currently requires that the data are stored in a
dataframe, which is pointed at by the \code{data} argument to
\code{lm} (or equivalent).
}
\examples{
m <- lm(Sepal.Length ~ ., data = iris)
iNZightSummary(m)

# exclude confounding variables for which you don't
# need to know about their coefficients:
iNZightSummary(m, exclude = "Sepal.Width")
}
\seealso{
The model fitting functions \code{\link{lm}}, \code{\link{glm}}, and
\code{\link{summary}}.

The \code{\link{survey}} package.

Function \code{\link{coef}} will extract the matrix of coefficients
with standard errors, t-statistics and p-values.

To calculate p-values for factors, use \code{\link[car]{Anova}} with
type III sums of squares.
}
\author{
Simon Potter, Tom Elliott.
}

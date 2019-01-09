\name{DualPredict}
\alias{DualPredict}
\title{
Predictions from a two-model estimator
}
\description{
Predictions from the two-model uplift model estimator with associated model performance.
}
\usage{
DualPredict(data, treat, outcome, model, nb.group = 10, plotit = FALSE)
}
\arguments{
  \item{data}{
a data frame containing the treatment, the outcome and the predictors.
}
  \item{treat}{
name of a binary (numeric) vector representing the treatment assignment (coded as 0/1).
}
  \item{outcome}{
name of a binary response (numeric) vector (coded as 0/1).
}
  \item{model}{
a model that must be the output of \code{DualUplift} function.
}
  \item{nb.group}{
number of groups of equal observations in which to partition the data in order to compute model performance. 
}
  \item{plotit}{
if \code{TRUE}, a \code{QiniCurve} and \code{QiniBarPlot} are returned. 
}
}
\value{
\item{data}{a data frame augmented with the predicted uplift}
\item{qini }{a Qini Coefficient}
}
\author{
Mouloud Belbahri
}
\seealso{
\code{DualUplift}
}
\examples{

library(tools4uplift)
data("SimUplift")

fit <- DualUplift(SimUplift, "treat", "y", predictors = colnames(SimUplift[, 3:12]))

pred <- DualPredict(SimUplift, "treat", "y", model = fit, nb.group = 5)[[1]]

}
\keyword{prediction}
\keyword{uplift}

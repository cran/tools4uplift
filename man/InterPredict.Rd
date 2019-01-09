\name{InterPredict}
\alias{InterPredict}
\title{
Predictions from an interaction estimator
}
\description{
Predictions from the interaction uplift model estimator with associated model performance.
}
\usage{
InterPredict(data, treat, outcome, model, nb.group = 10, plotit = FALSE)
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
a model that must be the output of \code{InterUplift} function.
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
\code{InterUplift}
}
\examples{

library(tools4uplift)
data("SimUplift")

fit <- InterUplift(SimUplift, "treat", "y", colnames(SimUplift[, 3:12]))

pred <- InterPredict(SimUplift, "treat", "y", model = fit, nb.group = 5)[[1]]

}
\keyword{prediction}
\keyword{uplift}

\name{DualUplift}
\alias{DualUplift}
\title{
Two-model estimator
}
\description{
Fit the two-model uplift model estimator.
}
\usage{
DualUplift(data, treat, outcome, predictors)
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
  \item{predictors}{
a vector of names representing the explanatory variables to include in the model.
}
}
\value{

\item{model0}{Fitted model for control group}
\item{model1}{Fitted model for treatment group}

}
\author{
Mouloud Belbahri
}
\seealso{
\code{DualPredict}
}
\examples{

library(tools4uplift)
data("SimUplift")

fit <- DualUplift(SimUplift, "treat", "y", predictors = colnames(SimUplift[, 3:12]))

}
\keyword{uplift}

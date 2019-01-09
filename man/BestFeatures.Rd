\name{BestFeatures}
\alias{BestFeatures}
\title{
Feature selection for the interaction estimator
}
\description{
Penalized logistic regression (LASSO) in order to select the features that maximize the Qini coefficient. 
}
\usage{
BestFeatures(data, treat, outcome, predictors, nb.lambda = 100, nb.group = 10, 
              validation = FALSE, p = 0.3, value = FALSE)
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
a vector of names representing the predictors to consider in the model.
}
  \item{nb.lambda}{
the number of lambda values - Default is 100.
}
  \item{nb.group}{
the number of groups for computing the Qini coefficient - Default is 10.
}
  \item{validation}{
if TRUE, the best features are selected based on cross-validation - Default is FALSE.
}
  \item{p}{
if validation is TRUE, the desired proportion for the validation set. p is a value between 0 and 1 expressed as a decimal, it is set to be proportional to the number of observations per group - Default is 0.3.
}
  \item{value}{
if TRUE, the values of the best lambda and Qini coefficient will be printed - Default is FALSE.
}
}
\details{
The regularization parameter is chosen based on the interaction uplift model that maximizes the Qini coefficient. Using the LASSO penalty, some predictors have coefficients set to zero.
}
\value{
a vector of names representing the selected best features from the penalized logistic regression.
}
\author{
Mouloud Belbahri
}
\examples{

library(tools4uplift)
data("SimUplift")

features <- BestFeatures(data = SimUplift, treat = "treat", outcome = "y", 
                         predictors = colnames(SimUplift[,3:7]))
features

}
\keyword{LASSO}
\keyword{logistic}
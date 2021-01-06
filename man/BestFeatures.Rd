\name{BestFeatures}
\alias{BestFeatures}
\title{
Qini-based feature selection
}
\description{
Qini-based Uplift Regression in order to select the features that maximize the Qini coefficient. 
}
\usage{
BestFeatures(data, treat, outcome, predictors, rank.precision = 2, 
                            equal.intervals = FALSE, nb.group = 10, 
                            validation = TRUE, p = 0.3) 
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
  \item{rank.precision}{
precision for the ranking quantiles to compute the Qini coefficient. Must be 1 or 2. If 1, the ranking quantiles will be rounded to the first decimal. If 2, to the second decimal.
}
  \item{equal.intervals}{
flag for using equal intervals (with equal number of observations) or the true ranking quantiles which result in an unequal number of observations in each group to compute the Qini coefficient.
}
  \item{nb.group}{
the number of groups for computing the Qini coefficient if equal.intervals is TRUE - Default is 10.
}
  \item{validation}{
if TRUE, the best features are selected based on cross-validation - Default is TRUE.
}
  \item{p}{
if validation is TRUE, the desired proportion for the validation set. p is a value between 0 and 1 expressed as a decimal, it is set to be proportional to the number of observations per group - Default is 0.3.
}
}
\details{
The regularization parameter is chosen based on the interaction uplift model that maximizes the Qini coefficient. Using the LASSO penalty, some predictors have coefficients set to zero.
}
\value{
a vector of names representing the selected best features from the penalized logistic regression.
}
\references{
Belbahri, M., Murua, A., Gandouet, O., and Partovi Nia, V. (2019) Uplift Regression, 
<https://dms.umontreal.ca/~murua/research/UpliftRegression.pdf>
}
\author{
Mouloud Belbahri
}
\examples{

library(tools4uplift)
data("SimUplift")

features <- BestFeatures(data = SimUplift, treat = "treat", outcome = "y", 
                         predictors = colnames(SimUplift[,3:7]),
                         equal.intervals = TRUE, nb.group = 5, 
                         validation = FALSE)
features

}
\keyword{LASSO}
\keyword{Qini}
\keyword{logistic}
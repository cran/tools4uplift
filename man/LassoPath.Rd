\name{LassoPath}
\alias{LassoPath}
\title{
LASSO path for penalized logistic regression
}
\description{
Fit an interaction uplift model via penalized maximum likelihood. The regularization path is computed for the lasso penalty at a grid of values for the regularization parameter lambda.
}
\usage{
LassoPath(data, formula, nb.lambda = 100)
}
\arguments{
  \item{data}{
a data frame containing the treatment, the outcome and the predictors.
}
  \item{formula}{
an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted.
}
  \item{nb.lambda}{
the number of lambda values - Default is 100.
}
}
\value{
a dataframe containing the coefficients values and the number of nonzeros coefficients for different values of lambda.
}
\references{
Friedman, J., Hastie, T. and Tibshirani, R. (2008) Regularization Paths for Generalized Linear Models via Coordinate Descent, https://web.stanford.edu/~hastie/Papers/glmnet.pdf, Journal of Statistical Software, Vol. 33(1), 1-22 Feb 2010, http://www.jstatsoft.org/v33/i01/
}
\author{
Mouloud Belbahri
}
\seealso{
\code{BestFeatures}, \code{glmnet}
}
\examples{
#See glmnet() from library("glmnet") for more information
}
\keyword{LASSO}
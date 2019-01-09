\name{SquareUplift}
\alias{SquareUplift}
\title{
Bivariate categorization
}
\description{
A non-parametric heat map representing the observed uplift in squares that explore a bivariate dimension space. The function also predicts the individual uplift based on the heatmap. 
}
\usage{
SquareUplift(data, var1, var2, treat, outcome, n.split = 10, 
             n.min = 1, categorize = TRUE, nb.group = 3, 
             plotit = TRUE, nb.col = 20)
}
\arguments{
  \item{data}{
a data frame containing uplift models variables. 
}
  \item{var1}{
x-axis variable name. Represents the first dimension of interest.
}
  \item{var2}{
y-axis variable name. Represents the second dimension of interest.
}
  \item{treat}{
name of a binary (numeric) vector representing the treatment assignment (coded as 0/1).
}
  \item{outcome}{
name of a binary response (numeric) vector (coded as 0/1).
}
  \item{n.split}{
the number of intervals to consider per explanatory variable. Must be an integer > 1. 
}
  \item{n.min}{
minimum number of observations per group (treatment and control) within each square. Must be an integer > 0.
}
  \item{categorize}{
if TRUE, the algorithm will augment the data with the categorical variable \code{Cat_var1_var2} with \code{nb.group} categories sorted from the highest to the lowest predicted uplift.
}
  \item{nb.group}{
number of categories of equal observations of the variable \code{Cat_var1_var2}. Must be an integer > 1.
}
  \item{plotit}{
if TRUE, a heatmap of observed uplift per square is plotted.
}
  \item{nb.col}{
number of colors for the heatmap. From \code{royalblue} to \code{red}. Default is 20. Must be an integer and should greater than \code{n.split} for better visualization.
}
}
\value{
returns an augmented dataset with \code{Uplift_var1_var2} variable representing a predicted uplift for each observation based on the square it belongs to. By default, the function creates also a categorical variable \code{Cat_var1_var2} based on the predicted uplift and plots a heat map of observed uplift.
}
\author{
Mouloud Belbahri
}
\examples{

library(tools4uplift)
data("SimUplift")

square <- SquareUplift(SimUplift, "X1", "X2", "treat", "y")

}
\keyword{heatmap}
\keyword{uplift}

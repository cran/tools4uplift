\name{BinUpliftEnhanced}
\alias{BinUpliftEnhanced}
\title{
Univariate categorization - augmented data
}
\description{
Univariate optimal partitionning for Uplift Models. The algorithm categorizes several variables into bins and creates an augmented dataset with the binned variables.
}
\usage{
BinUpliftEnhanced(data, treat, outcome, var.list, n.split = 10, 
                  alpha = 0.05, n.min = 30, ylim = NULL, 
                  ylab = "Uplift", title = "Binning Results", 
                  color = NULL)
}
\arguments{
  \item{data}{
a data frame containing the treatment, the outcome and the predictor to categorize.
}
  \item{treat}{
name of a binary (numeric) vector representing the treatment assignment (coded as 0/1).
}
  \item{outcome}{
name of a binary response (numeric) vector (coded as 0/1).
}
  \item{var.list}{
a vector of names representing the explanatory variables to categorize.
}
  \item{n.split}{
number of splits to test at each node. For continuous explanatory variables only (must be > 0).
}
  \item{alpha}{
significance level of the statistical test (must be between 0 and 1).
}
  \item{n.min}{
minimum number of observations per child node.
}
  \item{ylim}{
a range for the y axis.
}
  \item{ylab}{
a title for the y axis.
}
  \item{title}{
an overall title for the plot.
}
  \item{color}{
a color for the plot. If ommitted, the color will be set by default to a custom light blue. 
}
}
\value{
an augmented data frame with categorized variables. If a variable is enhanced, the function returns automatically a barplot.
}
\author{
Olivier Gandouet
}
\seealso{
\code{BinUplift}
}
\examples{

library(tools4uplift)
data("SimUplift")

train.enhanced <- BinUpliftEnhanced(data = SimUplift, treat = "treat", outcome = "y", 
                                    var.list = colnames(SimUplift[,3:7]))
}
\keyword{tree}
\keyword{binning}
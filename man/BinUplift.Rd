\name{BinUplift}
\alias{BinUplift}
\title{
Univariate categorization
}
\description{
Univariate optimal partitionning for Uplift Models. The algorithm categorizes a single variable into bins with significantly different observed uplift.
}
\usage{
BinUplift(data, treat, outcome, x, n.split = 10, alpha = 0.05, 
          n.min = 30, ylim = NULL, ylab = "Uplift",
          title = "Binning Results", color = NULL)
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
  \item{x}{
name of the explanatory variable to categorize.
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

\item{out.tree}{Descriptive statistics for the different nodes of the tree}
\item{sas.code}{SAS code generated for variable categorization}

}
\author{
Mouloud Belbahri
}
\seealso{
\code{BinUpliftEnhanced}
}
\examples{

library(tools4uplift)
data("SimUplift")

binX1 <- BinUplift(data = SimUplift, treat = "treat", outcome = "y", x = "X1", 
                  alpha = 0.10, n.min = 3, title = "Binning for X1")

}
\keyword{tree}
\keyword{binning}

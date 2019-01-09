\name{QiniCurve}
\alias{QiniCurve}
\title{
Qini curve
}
\description{
Curve of the function Qini, the incremental observed uplift with respect to predicted uplift sorted from the highest to the lowest.
}
\usage{
QiniCurve(x, title = "Model Performance: Qini Curve", color = NULL)
}
\arguments{
  \item{x}{
a table that must be the output of \code{QiniTable} function.
}
  \item{title}{
an overall title for the plot.
}
  \item{color}{
color of the curve.
}
}
\value{
a Qini curve
}
\references{
Radcliffe, N. and Surry, P. (2011). Real-World Uplift Modelling with Significance-Based Uplift Trees. Portrait Technical Report, TR-2011-1.

Radcliffe, N. (2007). Using control groups to target on predicted lift: Building and assessing uplift models. Direct Marketing Analytics Journal, An Annual Publication from the Direct Marketing Association Analytics Council, pages 14-21.
}
\author{
Mouloud Belbahri
}
\seealso{
\code{QiniTable}
}
\examples{

library(tools4uplift)
data("SimUplift")

square1 <- SquareUplift(SimUplift, "X1", "X2", "treat", "y")

#performance of the heat map uplift estimation on the training dataset
perf <- QiniTable(data = square1, treat = "treat", 
                  outcome = "y", prediction = "Uplift_X1_X2", nb.group = 5)
QiniCurve(perf)

}
\keyword{Qini}
\keyword{performance}

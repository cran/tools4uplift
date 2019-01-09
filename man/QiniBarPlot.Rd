\name{QiniBarPlot}
\alias{QiniBarPlot}
\title{
Uplift barplot
}
\description{
Barplot of observed uplift with respect to predicted uplift sorted from the highest to the lowest.
}
\usage{
QiniBarPlot(x, title = "Model Performance: Uplift by Group", color = NULL)
}
\arguments{
  \item{x}{
a table that must be the output of \code{QiniTable} function.
}
  \item{title}{
an overall title for the plot.
}
  \item{color}{
color of the barplot.
}
}
\value{
a barplot
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

QiniBarPlot(perf)

}
\keyword{Qini}
\keyword{performance}

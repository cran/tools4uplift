QiniBarPlot <- function(x, title = "Model Performance: Uplift by Group", color = NULL){
  
  # Plots the Qini barplot.
  #
  # Args:
  #   x: a table that must be the output of QiniTable() function.
  #
  # Returns:
  #   The Qini barplot.
  
  if (is.null(color)==TRUE) {
    color <- rgb(097, 154, 188, 255, maxColorValue = 255)
  }
  
  barplot(x[,8]*100, 
          names.arg = round(x[,1]*100), 
          col = color,
          xlab = "Proportion of Population Targeted (%)",
          ylab = "Uplift (%)",
          cex.main = 0.85,
          main = title)
}

# END FUN
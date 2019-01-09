QiniTable <- function(data, treat, outcome, prediction, nb.group = 10){
  
  # Computes the performance of an uplift estimator.
  #
  # Args:
  #   data: a data frame containing the treatment, the outcome and the predictors.
  #   treat: name of a binary (numeric) vector representing the treatment 
  #          assignment (coded as 0/1).
  #   outcome: name of a binary response (numeric) vector (coded as 0/1).
  #   prediction: a predicted uplift to sorts the observations from highest 
  #               to lowest uplift.
  #   ... and default parameters.
  #
  # Returns:
  #   The performance of an uplift estimator in a table.
  
  # Error handling
  if (nb.group < 2) {
    stop("The number of groups must be greater or equal to 2")
  }
  
  # First, we need to rank and sort the observations
  data$rank <- 0
  data$rank = rank(-data[[prediction]], ties.method = "min") / nrow(data)
  
  data$group <- 0
  for(i in 1:nb.group) {
      data$group[data$rank > (i-1)/nb.group & data$rank <= i/nb.group] <- i
  }
  
  dataResults <- data.frame(matrix(rep(0), nb.group, 8))
  colnames(dataResults) <- c("cum_per", "T_Y1", "T_n", "C_Y1", 
                             "C_n", "incremental_Y1", "inc_uplift", "uplift")
  
  # Incremental observed uplift
  for(i in 1:nb.group){
    subset <- data[data$group <= i, ]
    dataResults[i,1] <- i/nb.group
    dataResults[i,2] <- sum(subset[[treat]] == 1 & subset[[outcome]] == 1)
    dataResults[i,3] <- sum(subset[[treat]] == 1)
    dataResults[i,4] <- sum(subset[[treat]] == 0 & subset[[outcome]] == 1)
    dataResults[i,5] <- sum(subset[[treat]] == 0)
    dataResults[i,6] <- dataResults[i, 2] - dataResults[i, 4]*dataResults[i, 3]/dataResults[i, 5] 
  }
  dataResults[,7] <- dataResults[,6]/dataResults[nb.group,3]*100
  
  
  # Observed uplift in each group
  for (i in 1:nb.group){
    subset <- data[data$group == i, ]
    dataResults[i,8] <- sum(subset[[treat]] == 1 & subset[[outcome]] == 1) / sum(subset[[treat]] == 1) -  
                        sum(subset[[treat]] == 0 & subset[[outcome]] == 1) / sum(subset[[treat]] == 0)
  }
  
  return(dataResults)
}

# END FUN
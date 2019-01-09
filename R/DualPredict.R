DualPredict <- function(data, treat, outcome, model, nb.group = 10, plotit = FALSE){
  
  # Predictions from a two-model estimator.
  #
  # Args:
  #   data: a data frame containing the treatment, the outcome and the predictors.
  #   treat: name of a binary (numeric) vector representing the treatment 
  #          assignment (coded as 0/1).
  #   outcome: name of a binary response (numeric) vector (coded as 0/1).
  #   model: a model that must be the output of DualUplift() function.
  #   ... and default parameters.
  #
  # Returns:
  #   The predictions and performance of a two-model estimator.
  
  # Extract information from model dualUplift
  model0 <- model[[1]]
  model1 <- model[[2]]
  
  # Predict the 2 probabilities from model0 and model1
  pr.y1_ct1 <- predict(model1, newdata = data, type = "response")
  pr.y1_ct0 <- predict(model0, newdata = data, type = "response")
  
  data$uplift_prediction <- pr.y1_ct1 - pr.y1_ct0
  
  perf <- QiniTable(data, treat, outcome, "uplift_prediction", nb.group)
  if (plotit == TRUE) {
    QiniCurve(perf, title = "Qini Curve for dual model")
    QiniBarPlot(perf, title = "Uplift Bar Plot for dual model")
  }
  qini <- QiniArea(perf)
  
  return(list(data, qini))
}

# END FUN
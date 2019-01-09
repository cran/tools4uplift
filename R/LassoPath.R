LassoPath <- function(data, formula, nb.lambda=100){
  
  # LASSO path for penalized logistic regression.
  #
  # Args:
  #   data: a data frame containing the treatment, the outcome and the predictors.
  #   formula: an object of class "formula" (or one that can be coerced to that class): 
  #            a symbolic description of the model to be fitted.
  #   ... and default parameters.
  #
  # Returns:
  #   A dataframe containing the coefficients values and the number of nonzeros coefficients.

  X <- model.matrix(formula, data)
  y <- model.frame(formula,data)[,1]
  
  glmnet.output <- glmnet(X, y, alpha=1, family="binomial", nlambda = nb.lambda, intercept = FALSE)
  
  dimension <- glmnet.output$df
  coeff <- t(as.matrix(glmnet.output$beta))
  lambda <- glmnet.output$lambda
  
  path <- cbind(lambda, dimension, coeff)
  
  
  return(path)  
}

# END FUN
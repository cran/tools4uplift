BinUpliftEnhanced <- function(data, treat, outcome, var.list, n.split = 10, 
                              alpha = 0.05, n.min = 30, ylim = NULL, 
                              ylab = "Uplift", title = "Binning Results", 
                              color = NULL){
  
  # Univariate categorization - augmented data.
  #
  # Args:
  #   data: a data frame containing the treatment, the outcome and the predictors.
  #   treat: name of a binary (numeric) vector representing the treatment 
  #          assignment (coded as 0/1).
  #   outcome: name of a binary response (numeric) vector (coded as 0/1).
  #   var.list: a vector of names representing the explanatory variables to categorize.
  #   ... and default parameters.
  #
  # Returns:
  #   The augmented data frame with categorized variables.
  
  for (var_name in var.list) {
    # For now no gestion of categorical variables
      print(var_name)
      current_binning  <- BinUplift(data, treat, outcome, var_name, n.split, alpha, 
                                    n.min, ylim, ylab, title, color)
      if (length(current_binning$out.tree) == 1) {
        
        print(paste("Building: The variable", var_name, "will not be enhanced", sep = " "))
      
      } else {
        
        current_enhanced_var <- paste0("Bin_",var_name)
        data[, current_enhanced_var] <- 0
        
        for (threshold in current_binning[[1]]$x.cut) {
            data[, current_enhanced_var] <- as.double(data[, var_name]>threshold) + data[, current_enhanced_var]
        }
      }
  }
  return(data)
}

# END FUN

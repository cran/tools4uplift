SquareUplift <- function(data, var1, var2, treat, outcome, n.split = 10, 
                         n.min = 1, categorize = TRUE, nb.group = 3, 
                         plotit = TRUE, nb.col = 20){
  
  # Bivariate categorization.
  #
  # Args:
  #   data: a data frame containing the treatment, the outcome and the predictors.
  #   var1: name of the first explanatory variable to categorize.
  #   var2: name of the second explanatory variable to categorize.
  #   treat: name of a binary (numeric) vector representing the treatment 
  #          assignment (coded as 0/1).
  #   outcome: name of a binary response (numeric) vector (coded as 0/1).
  #   ... and default parameters.
  #
  # Returns:
  #   An augmented dataset with Uplift_var1_var2 variable representing a predicted 
  #   uplift for each observation based on the square it belongs to.
  
  
  # Error handling
  if (n.split <= 1) stop("n.split must be > 1")
  if (n.split %% 1 != 0) stop("n.split must be an integer")
  
  if (n.min < 0) stop("n.min must be >= 0")
  if (n.min %% 1 != 0) stop("n.min must be an integer")
  
  if (nb.group <= 1) stop("nb.group must be > 1")
  if (nb.group %% 1 != 0) stop("nb.group must be an integer")
  
  if (nb.col < n.split) warning("nb.col should be greater than n.split for better visualization")
  if (nb.col %% 1 != 0) stop("nb.col must be an integer")
  
  # Initalize grid of uplifts for training set
  range_var1 <- ceiling(max(data[, paste(var1)])) - floor(min(data[, paste(var1)]))
  step1 <- range_var1 / n.split
  seq_col <- seq(floor(min(data[, paste(var1)])), ceiling(max(data[, paste(var1)])), step1)
  
  range_var2 <- ceiling(max(data[, paste(var2)])) - floor(min(data[, paste(var2)]))
  step2 <- range_var2 / n.split
  seq_row <- seq(floor(min(data[, paste(var2)])), ceiling(max(data[, paste(var2)])), step2)
  
  n <- length(seq_row)-1
  m <- length(seq_col)-1
  grid <- matrix(nrow=n, ncol=m)
  biprediction <- paste0("Uplift_", var1, "_", var2)
  data[, biprediction] <- NA
  
  
  for (i in n:1){
    for (j in 1:m){
      
      index <- (data[, paste(var1)] <=  seq_col[j] + step1) & (data[, paste(var1)] >=  seq_col[j]) & (data[, paste(var2)] <= seq_row[n-i+1] + step2) & (data[, paste(var2)] >= seq_row[n-i+1])
      square <- data[index,]
      
      indexT <- square[, paste(treat)]==1
      indexC <- square[, paste(treat)]==0
      sizeT <- sum(indexT)
      sizeC <- sum(indexC)
      
      if (sizeT >= n.min & sizeC >= n.min){
        grid[i, j] <- sum(square[, paste(treat)] == 1 & square[, paste(outcome)] == 1)/
                      sum(square[, paste(treat)] == 1) -
                      sum(square[, paste(treat)] == 0 & square[, paste(outcome)] == 1)/ 
                      sum(square[, paste(treat)] == 0)
        data[index, biprediction] <-  grid[i, j]
      }
      
    }
  }
  
  # For the observations that were not scored, i.e. uplift=NA, impute the average
  # uplift of all NA
  
  index.naT <- is.na(data[, biprediction])==TRUE
  
  data[index.naT, biprediction] <- sum(data[index.naT, paste(treat)] == 1 & data[index.naT, paste(outcome)] == 1)/
                                   sum(data[index.naT, paste(treat)] == 1) - 
                                   sum(data[index.naT, paste(treat)] == 0 & data[index.naT, paste(outcome)] == 1)/
                                   sum(data[index.naT, paste(treat)] == 0)
  
  
  # Create the categorical version of var1 and var2
  if (categorize) {
    
    data.rank = rank(-data[, biprediction], ties.method = "min") / nrow(data)
    
    bicategorize <- paste0("Cat_",var1,"_",var2)
    # data[, bicategorize] <- 0
    for(i in 1:nb.group){
      data[data.rank > (i-1)/nb.group & data.rank <= i/nb.group, bicategorize] <- i
    }
  }
  # Plot the uplift heat map var1 and var2
  if (plotit) {  
    # Define the colors for the heat map
    colfunc <- colorRampPalette(c("red", "yellow", "springgreen", "royalblue"))
    
    # Reverse and transpose the grid in order to get the actual heat map with image function
    rev_grid <- apply(grid, 2, rev)
    par(mfrow = c(1, 2))
    
    image(seq_col, seq_row, t(rev_grid), xlab = paste(var1), ylab = paste(var2), 
          col = colfunc(nb.col))
    
    plot(rep(1,nb.col), seq(min(grid, na.rm = TRUE), max(grid, na.rm = TRUE), length.out = nb.col), 
         col = colfunc(nb.col), pch = 19, cex = 3, xaxt = "n", xlab="", ylab = "Observed Uplift", bty = "l")
    
    par(mfrow = c(1, 1))
  }
 
 return(data)
}

# END FUN
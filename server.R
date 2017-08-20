library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
      
      output$resTab <- renderPrint({
            
            if (1 %in% input$outputChoose ) {
                  carsdat <- data.frame(mtcars)
                  mpg <- carsdat$mpg
                  x <- carsdat[,-1]
                  pval <- numeric(ncol(x))
                  
                  for(i in 1:ncol(x)) {
                        fit <- lm(mpg ~ x[,i], data = carsdat)
                        pval[i] <- coef(summary(fit))[-1,4]
                  }
                  
                  p <- seq(input$preds)
                  ordered <- order(pval)[p]
                  if (ncol(as.data.frame(x[,ordered])) == 1) {
                        ordered_preds <- data.frame(mpg, as.data.frame(x[,ordered]))
                        names(ordered_preds) <- c("mpg","wt")
                  } else {
                        ordered_preds <- data.frame(mpg, as.data.frame(x[,ordered]))
                  }
                  
                  final_fit <- lm(mpg ~ ., data = ordered_preds)
                  summary(final_fit)$coefficients
            }
      })
      
      output$R2 <- renderPrint({
            
            if (2 %in% input$outputChoose ) {
                  carsdat <- data.frame(mtcars)
                  mpg <- carsdat$mpg
                  x <- carsdat[,-1]
                  pval <- numeric(ncol(x))
                  
                  for(i in 1:ncol(x)) {
                        fit <- lm(mpg ~ x[,i], data = carsdat)
                        pval[i] <- coef(summary(fit))[-1,4]
                  }
                  
                  p <- seq(input$preds)
                  ordered <- order(pval)[p]
                  if (ncol(as.data.frame(x[,ordered])) == 1) {
                        ordered_preds <- data.frame(mpg, as.data.frame(x[,ordered]))
                        names(ordered_preds) <- c("mpg","wt")
                  } else {
                        ordered_preds <- data.frame(mpg, as.data.frame(x[,ordered]))
                  }
                  
                  final_fit <- lm(mpg ~ ., data = ordered_preds)
                  noquote(paste0("R-squared: ", round(100*summary(final_fit)$r.squared,2),"%"))
            }
      })
      
      output$aR2 <- renderPrint({
            
            if (3 %in% input$outputChoose ) {
                  carsdat <- data.frame(mtcars)
                  mpg <- carsdat$mpg
                  x <- carsdat[,-1]
                  pval <- numeric(ncol(x))
                  
                  for(i in 1:ncol(x)) {
                        fit <- lm(mpg ~ x[,i], data = carsdat)
                        pval[i] <- coef(summary(fit))[-1,4]
                  }
                  
                  p <- seq(input$preds)
                  ordered <- order(pval)[p]
                  if (ncol(as.data.frame(x[,ordered])) == 1) {
                        ordered_preds <- data.frame(mpg, as.data.frame(x[,ordered]))
                        names(ordered_preds) <- c("mpg","wt")
                  } else {
                        ordered_preds <- data.frame(mpg, as.data.frame(x[,ordered]))
                  }
                  
                  final_fit <- lm(mpg ~ ., data = ordered_preds)
                  noquote(paste0("Adjusted R-squared: ", round(100*summary(final_fit)$adj.r.squared,2),"%"))
            }
      })
      
      output$resPlot <- renderPlot({
            
            if (4 %in% input$outputChoose ) {
                  carsdat <- data.frame(mtcars)
                  mpg <- carsdat$mpg
                  x <- carsdat[,-1]
                  pval <- numeric(ncol(x))
                  
                  for(i in 1:ncol(x)) {
                        fit <- lm(mpg ~ x[,i], data = carsdat)
                        pval[i] <- coef(summary(fit))[-1,4]
                  }
                  
                  p <- seq(input$preds)
                  ordered <- order(pval)[p]
                  if (ncol(as.data.frame(x[,ordered])) == 1) {
                        ordered_preds <- data.frame(mpg, as.data.frame(x[,ordered]))
                        names(ordered_preds) <- c("mpg","wt")
                  } else {
                        ordered_preds <- data.frame(mpg, as.data.frame(x[,ordered]))
                  }
                  
                  final_fit <- lm(mpg ~ ., data = ordered_preds)
                  
                  qqnorm(resid(final_fit), col = "blue", pch = 19)
                  qqline(resid(final_fit), col = "red", lwd = 2)
            }
      })
  
})

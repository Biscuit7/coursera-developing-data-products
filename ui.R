library(shiny)
library(ggplot2)

shinyUI(
      navbarPage("Regression on the 'mtcars' Dataset",
            tabPanel("Choosing the Best Predictors", 
                  sidebarLayout(
                        sidebarPanel(
                              sliderInput("preds", "Number of predictors:", min = 1, max = 10, value = 1),
                              checkboxGroupInput("outputChoose", 
                                                 label = h5("Choose desired output:"), 
                                                 choices = list("Coefficients" = 1, 
                                                                "R-squared" = 2, 
                                                                "Adjusted R-squared" = 3, 
                                                                "Residual Plot" = 4),
                                                 selected = c(1,2,4))
                        ),
                        mainPanel(h3("Model results"),
                                  h4("\n"),
                                  h4("Table of regression results"),
                                  verbatimTextOutput("resTab"),
                                  h4("Model fit"),
                                  textOutput("R2"),
                                  textOutput("aR2"),
                                  h4("\n"),
                                  h4("Plot to test normality of residuals"),
                                  plotOutput("resPlot")
                        )
                  )
            ),
            
            tabPanel("About",
                  h3("What it does"),
                  h5("My application determines the best predictors in the 'mtcars' dataset, with Miles per Gallon as the dependent variable. It applies simple regression on each variable and orders them with respect to model significance. It displays regression coefficients, model fit values and a plot to test normality of residuals."), 
                  h3("How to use it"),
                  h5("The user must use the slider to decide how many predictors are to be included in the model. The checkboxes are for the user to decide which output he/she wants to view.")
            )
      )
)

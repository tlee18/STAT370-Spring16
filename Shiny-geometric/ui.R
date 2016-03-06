library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel("Bayesian inference"),
  p("Exercise 8 Chapter 8 of Rice 3rd edition, page 314"),
  p("beta prior, likelihood is geometric, posterior is beta"),
  sidebarLayout(
    sidebarPanel(
      p("Prior is black, posterior is green"),
      numericInput("alpha", "alpha parameter for Beta prior:", 1,
                   min = 1, max = 100),
      numericInput("beta", "beta parameter for Beta prior:", 1,
                   min = 1, max = 100),
      numericInput("y", "number of trials required (including successes):", 5,
                   min = 1, max = 100),
      numericInput("n", "out of this many samples:", 1,
                   min = 1, max = 100)),
    # Show a plot of the generated distribution
    mainPanel(plotOutput("distPrior"))
  )
))

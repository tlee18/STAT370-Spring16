library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel("Bayesian inference"),
  p("Example E of section 3.5 of Rice 3rd edition, page 94-95"),
  p("beta prior (blue), likelihood is binomial, posterior is beta (green), plus likelihood (brown)"),
  p("See Figure 3.16 for results from a beta(1, 1) prior and 13 successes out of 20 attempts"),

  sidebarLayout(
    sidebarPanel(
      p("Prior is black, posterior is green"),
      numericInput("alpha", "alpha parameter for Beta prior:", 1,
                   min = 1, max = 100),
      numericInput("beta", "beta parameter for Beta prior:", 1,
                   min = 1, max = 100),
      numericInput("y", "number of successes observed:", 13,
                   min = 1, max = 100),
      numericInput("n", "out of this many trials (must be larger than # successes):", 20,
                   min = 1, max = 100)),
    # Show a plot of the generated distribution
    mainPanel(plotOutput("distPrior"))
  )
))

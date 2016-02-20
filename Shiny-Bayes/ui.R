library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel("Bayesian inference"),
  p("Example E of section 3.5 of Rice 3rd edition, page 94-95"),

  sidebarLayout(
    sidebarPanel(
      numericInput("alpha", "alpha parameter for Beta prior:", 2,
                   min = 1, max = 100),
      numericInput("beta", "beta parameter for Beta prior:", 2,
                   min = 1, max = 100),
      numericInput("y", "number of successes observed:", 1,
                   min = 1, max = 100),
      numericInput("n", "out of this many trials (must be larger than # successes):", 3,
                   min = 1, max = 100),
      selectInput("posterior", "Display posterior?",
                  choices = c("Yes", "No"), selected="No")),
    # Show a plot of the generated distribution
    mainPanel(plotOutput("distPlot"))
  )
))

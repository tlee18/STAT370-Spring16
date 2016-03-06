shinyServer(function(input, output) {
  output$distPrior <- renderPlot({
 
    require(mosaic)
    require(latticeExtra)
    trellis.par.set(theme=theme.mosaic())
    prior <- list(input$alpha, input$beta)
    posterior <- list((input$alpha + input$y), (input$beta + input$n - input$y))
    xvals <- seq(0, 1, length=101)
    eps <- 0.05
    maxy1 <- max(dbeta(xvals, prior[[1]], prior[[2]]))
    maxy2 <- max(dbeta(xvals, posterior[[1]], posterior[[2]]))

    plot1 <- plotDist('beta', params=prior, 
                     ylim=c(0, min(8, max(maxy1, maxy2)+eps)), xlim=c(0, 1), lwd=2)
    plot2 <- plotDist('beta', params=posterior, lwd=2, col="green")
    plot1 + as.layer(plot2)
    })
  }
)


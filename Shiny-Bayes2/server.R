shinyServer(function(input, output) {
  output$distPrior <- renderPlot({
 
    require(mosaic)
    require(latticeExtra)
    trellis.par.set(theme=theme.mosaic())
    prior <- list(input$alpha, input$beta)
    posterior <- list((input$alpha + input$y), (input$beta + input$n - input$y))

    # pesky details to tweak y axis limits
    xvals <- seq(0, 1, length=101)
    eps <- 0.10
    maxy1 <- max(dbeta(xvals, prior[[1]], prior[[2]]))
    maxy2 <- max(dbeta(xvals, posterior[[1]], posterior[[2]]))
    maxy <- min(8, max(maxy1, maxy2)+eps)

    # pesky detail to rescale the likelihood
    maxbinom <- dbinom(input$y, input$n, input$y/input$n)
    mle <- makeFun(0.99*maxy/maxbinom*choose(n, y)*p^y*(1-p)^(n-y) ~ p, n=input$n, y=input$y)

    # display the results
    plot1 <- plotDist('beta', params=prior, 
                     ylim=c(0, maxy), xlim=c(0, 1), lwd=2)
    plot2 <- plotDist('beta', params=posterior, lwd=2, col="green")
    plot3 <- plotFun(mle(p) ~ p, lwd=2, col="brown")
    tmpplot <- plot1 + as.layer(plot2)
    tmpplot + as.layer(plot3)
    })
  }
)


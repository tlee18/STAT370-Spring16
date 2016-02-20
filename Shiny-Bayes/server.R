shinyServer(function(input, output) {
  output$distPrior <- renderPlot({
 
    require(mosaic)
    trellis.par.set(theme=theme.mosaic())

    print(plotDist('beta', params=list(input$alpha, input$beta), 
                     main="Prior distribution", xlim=c(0, 1), lwd=2)) 
    })
  
  output$distPost <- renderPlot({
    
    require(mosaic)
    trellis.par.set(theme=theme.mosaic())
    print(plotDist('beta', 
                     params=list((input$alpha + input$y), (input$beta + input$n - input$y)), 
                     main="Posterior distribution", xlim=c(0, 1), lwd=2))

  })
  
  }
)


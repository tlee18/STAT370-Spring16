shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
 
    require(mosaic)
    trellis.par.set(theme=theme.mosaic())

    # generate the desired plot
    if (input$posterior == "No") {
      print(plotDist('beta', params=list(input$alpha, input$beta), ylim=c(0, 4), 
                     main="Prior distribution", lwd=2)) 
    } else if (input$posterior == "Yes") {
      print(plotDist('beta', 
            params=list((input$alpha + input$y), (input$beta + input$n)), 
            main="Posterior distribution", lwd=2))
    } 
    })
  }
)


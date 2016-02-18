library(ggvis)
shinyUI(bootstrapPage(
  p("Rice 3rd edition Exercise 10.50: Highway occupancy"),
  p("Brush by selecting points in first plot to color, hover in any to display values"),
  
  uiOutput("ggvis_ui1"),
  ggvisOutput("ggvis1"),
  
  uiOutput("ggvis_ui2"),
  ggvisOutput("ggvis2"),
  
  uiOutput("ggvis_ui3"),
  ggvisOutput("ggvis3")

))

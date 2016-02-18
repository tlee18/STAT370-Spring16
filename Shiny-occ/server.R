shinyServer(function(input, output) {

  library(mosaic)
  library(ggvis)
  library(lubridate)
  library(shiny)
  
  load("occ.Rda")
  
  all_values <- function(x) {
    if (is.null(x)) return(NULL) 
    row <- occ[occ$id == x$id, ]
    paste0(names(row), ": ", format(row), collapse = "<br />")
  }

  lb <- linked_brush(keys = 1:nrow(occ), "red")
  # Change the colour of the points, then click on the stop sign
  occ %>%
    ggvis(~time, ~Lane.1.Occ, key := ~id) %>%
    layer_points(fill := lb$fill, size.brush := 100) %>%
    add_tooltip(all_values, "hover") %>%
    lb$input() %>%
    bind_shiny("ggvis1", "ggvis_ui1")
  
  occ %>%
    ggvis(~Lane.1.Occ, ~Lane.1.Flow, key := ~id) %>%
    layer_points(size.brush := 100) %>%
    add_tooltip(all_values, "hover") %>%
    layer_points(fill := "red", data = reactive(occ[lb$selected(), ])) %>%
    bind_shiny("ggvis2", "ggvis_ui2")
  
  occ %>% 
    ggvis(y = ~Lane.1.Flow, x = ~time, key := ~id) %>%
    layer_points() %>%
    add_tooltip(all_values, "hover") %>%
    layer_points(fill := "red", data = reactive(occ[lb$selected(), ])) %>%
    bind_shiny("ggvis3", "ggvis_ui3")
})
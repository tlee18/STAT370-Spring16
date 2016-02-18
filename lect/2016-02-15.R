# Nicholas Horton (nhorton@amherst.edu)
# February 14, 2016
library(ggvis)
library(mosaic)
library(lubridate)
library(GGally)

# PRELUDE: Read the data (and potentially stash it away..)
occ <- read.csv("http://www.amherst.edu/~nhorton/rice/chapter10/flow-occ.csv")
occ <- mutate(occ, time = mdy_hms(Timestamp),
              day = day(time), 
              id = 1:nrow(occ),
              Lane.1.Occchange = Lane.1.Occ - lag(Lane.1.Occ))
 save(occ, file="occ.Rda")
 load("occ.Rda")

# INTERLUDE 1: Scatterplot matrices
sortocc <- select(occ, Lane.1.Occ, Lane.2.Occ, Lane.1.Flow, Lane.2.Flow, time)
splom(sortocc, cex=0.1)

# or
# ggpairs(sortocc)    # takes a long time to render....


# INTERLUDE 2: Brushing part A

lb <- linked_brush(keys = 1:nrow(occ), "red")
# Change the colour of the points, then click on the stop sign
occ %>%
  ggvis(~time, ~Lane.1.Occ) %>%
  layer_points(fill := lb$fill, size.brush := 400) %>%
  lb$input()


# INTERLUDE 3: Brushing part B
# Then run this to 
# display one layer with all points and another layer with selected points
library(shiny)

occ %>%
  ggvis(~Lane.1.Occ, ~Lane.1.Flow) %>%
  layer_points(size.brush := 400) %>%
  lb$input() %>%
  layer_points(fill := "red", data = reactive(occ[lb$selected(), ]))
# need to click Stop Sign to continue

# or this

occ %>%
  ggvis(~Lane.1.Occ, ~Lane.2.Occ) %>%
  layer_points(size.brush := 400) %>%
  lb$input() %>%
  layer_points(fill := "red", data = reactive(occ[lb$selected(), ]))
# need to click Stop Sign to continue


# INTERLUDE 4: Identifying points
# Enter the tooltip

all_values <- function(x) {
  if (is.null(x)) return(NULL) 
  row <- occ[occ$id == x$id, ]
  paste0(names(row), ": ", format(row), collapse = "<br />")
}

occ %>% 
  ggvis(y = ~Lane.1.Occ, x = ~time, key := ~id) %>%
  layer_points() %>%
  add_tooltip(all_values, "hover")
# need to click Stop Sign to continue






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
# save(occ, file="occ.Rda")
# load("occ.Rda")


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






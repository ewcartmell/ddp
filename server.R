#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggvis)
library(tidyverse)
library(magrittr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
  vis = reactive({
    
    mtcars$cyl <- as.factor(mtcars$cyl)
    minhp <- input$hp[1]
    maxhp <- input$hp[2]
    
    mindisp <- input$disp[1]
    maxdisp <- input$disp[2]
    
    m <- mtcars %>%
      filter(
        ##Reviews >= reviews,
        ##Oscars >= oscars,
        hp >= minhp,
        hp <= maxhp,
        disp >= mindisp,
        disp <= maxdisp
      )
    
    ggvis(m,  ~hp, ~mpg) %>%
      layer_points(size := 50, size.hover := 200,
          fillOpacity := 0.5, fillOpacity.hover := 0.5, 
          fill = ~cyl)##, key := ~ID)
    
  })
  
  vis %>% bind_shiny("plot1")
  
  

})

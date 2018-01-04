#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggvis)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("MTCars MPG Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("hp",
                   "Horsepower Range",
                   min = 1,
                   max = 350,
                   value = c(0, 500)), 
      sliderInput("disp",
                  "Displacement Range",
                  min = 70,
                  max = 500,
                  value = c(70, 500))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       ggvisOutput("plot1")
    )
  )
))

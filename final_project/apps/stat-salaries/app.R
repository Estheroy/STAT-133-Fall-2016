# ========================================================================
# Title: app.R
#
# Description:
# R script for Shiny app stat-salaries.  
# To visualize the relationship between all the player statistics— including 
# the EFF∗ index—and the salary, it displays a scatterplot in which the x-axis
# corresponds to one statistic, and the y-axis corresponds to salary 
# (by default). Include a widget that lets you select the specific statistic 
# for the x-axis. Include another widget that lets you select a variable for 
# the y-axis (salary by default). Include another widget to indicate whether 
# the dots should be colored by position. The app should also display the 
# correlation coefficient between the chosen variables.
# ========================================================================

library(shiny)
library(ggplot2)
library(readr)


# source your functions
source("shiny-stat-salary-function.R")

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
   
   # Application title
   titlePanel("Statistics Salary"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        selectInput("x_statistics",
                    "Statistics for x-axis:",
                    c("total points",
                      "total rebounds",
                      "assists",
                      "steals",
                      "blocks",
                      "turnovers",
                      "games played",
                      "salary",
                      "missed field goals",
                      "missed free throws",
                      "efficiency index")),
        selectInput("y_statistics",
                    "Statistics for y-axis:",
                    c("total points",
                      "total rebounds",
                      "assists",
                      "steals",
                      "blocks",
                      "turnovers",
                      "games played",
                      "salary",
                      "missed field goals",
                      "missed free throws",
                      "efficiency index"),
                    selected = "salary"),
        checkboxInput("position", 
                      "Color by Position", 
                      TRUE),
        hr(),
        helpText("C: center"),
        helpText("PF: power forward"),
        helpText("SF: small forward"),
        helpText("SG: shooting guard"),
        helpText("PG: point guard"),
        hr(),
        helpText("Correlation coefficient"),
        verbatimTextOutput("coeff")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
   
  eff <- reactive({ 
    load_team_eff() 
  })
  
  output$distPlot <- renderPlot({
    plot_stats(eff(), input$x_statistics, input$y_statistics, input$position)
  })
  
  output$coeff <- renderText({
    find_corr(eff(), input$x_statistics, input$y_statistics)
  })
})

# Run the application 
shinyApp(ui <- ui, server <- server)


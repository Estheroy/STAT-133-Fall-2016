# ========================================================================
# Title: app.R
#
# Description:
# R script for Shiny app team-salaries.  
# To visualize the different statistics, it displays a horizontal bar-chart 
# (one bar per team) with one widget to select the desired statistic, and 
# another widget to indicate whether the bars should be displayed in decreasing
# order or in ascending order. Optionally, you can add more widgets to provide
# more options for customizing the displayed bar-chart (colors, bar widths, 
# legends, annotations, etc).
# ========================================================================

# load library that will be used
library(shiny)
library(ggplot2)
library(readr)

# source your functions
source("shiny-team-salary-function.R")

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
   
   # Application title
   titlePanel("Team Salary"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
     sidebarPanel(
       selectInput("statistics",
                   "Statistics:",
                   c("total payroll",
                     "minimum salary",
                     "maximum salary",
                     "first quartile salary",
                     "median salary",
                     "third quartile salary",
                    "average salary",
                    "interquartile range",
                    "standard deviation"
                    )),
      selectInput("order", 
                   "display order:", 
                   c("Descending", "Ascending")),
      checkboxInput("show", 
                    "Show legend", 
                    TRUE)),
    # Show a plot of the generated distribution
    mainPanel(
         plotOutput("distPlot")
    ))
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  salary <- reactive({ 
    load_team_salary() 
  })
   
  output$distPlot <- renderPlot({
    plot_stats(salary(), input$statistics, input$order, input$show) 
  })
})

# Run the application 
shinyApp(ui <- ui, server <- server)


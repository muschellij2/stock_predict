
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      dateInput("run_date", "Analysis Day"),
      actionButton("run_stuff", "Run!"),
      p("Data before 2015/11/14 will run faster as it is preloaded")
      # ,submitButton("Submit")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(id = "mytabs", 
                  tabPanel("Description",
                           h3("here is my description")),
                  tabPanel("Output",
        plotOutput("distPlot"),
        tableOutput("mytab")
                  )
      )
      
    )
  )
))

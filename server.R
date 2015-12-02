
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
# source("Myfunctions.R")
load("stocks.rda")

shinyServer(function(input, output) {

#   get_date = reactive({
#     print(input$run_date)
#     print(class(input$run_date))
#     return()
#   })


  
  values <- reactiveValues( stock_data = NULL)
  observe({
    
    ### Download all the quantmod data 
    if (input$run_stuff > 0) {
      values$stock_data = "i'm output!"
      # getSymbols(stocks$Ticker, src = "yahoo")
      # data = my_get_data_function(input$run_date)
      print("I'm running")
      # input$run_stuff = 0
    }
    
  })
  
  # df is "FUNCTION", you call it with df()
  df <- eventReactive(input$run_stuff, {
    # clean_data = my_clean(input$date)
    # my_predict = my_prediction_function(clean_data)
    # my_tab = my_tab_fcn(my_predict)
    my_dates = c(input$run_date, input$run_date + c(1:4))
    df = data.frame(my_dates, rank = 1:5)
    df2 = df
    df2$y = rnorm(5)
    list(table = df, points_for_scatter = df2)
  })
  
  output$mytab <- renderTable({
    tab = df()$table
    return(tab)
  })
  
  output$distPlot <- renderPlot({
    # my_date = get_date()
    points = df()$points_for_scatter
    print(points)
    if (is.null(points)) {
    # if (input$run_stuff > 0) {
      plot(0, 0)
    } else {
      plot(points$rank, points$y)
    }
    # } else {
    # plot(0, 0, main = "Nothing happened")
    # }
  })  
  
#   observe({
#     print(input$run_stuff)
#     ### Predict on the data
#     stock_data = values$stock_data
#     if (!is.null(stock_data)) {
#       # run my prediction
#       # pred = predict(model, stock_data)
#       # values$prediction = pred
#       print("I'm predicting!")
#     }
#     
#   })
#   


})

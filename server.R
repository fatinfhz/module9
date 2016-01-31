#server.R

library(shiny)

server<- function(input, output) {
  output$inputValueDuration <- renderPrint({input$Duration})
  output$inputValueWeight <- renderPrint({input$Weight})
  output$CalorieCalculation <- renderPrint({CalCount(input$Duration,input$Weight)})
}
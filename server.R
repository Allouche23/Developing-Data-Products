

library(shiny)
library(dplyr)
attach(USArrests)
data1 <- USArrests

# Define server logic required to draw a histogram
shinyServer(function(input, output){
  modela <- glm(Murder ~ UrbanPop, data = data1)

   premo <- reactive({
    popind <- input$popin
    predict(modela, newdata = data.frame(UrbanPop = popind))
  })

  output$distPlot <- renderPlot({
    popind <- input$popin
plot(data1$UrbanPop, data1$Murder, xlab = "Urban Population in percent", ylab = "Murders")
abline(modela, col = "red")

   points(popind,premo(), col= "red", pch = 20, cex = 3)

  })
  output$predict <- renderText({
    premo()

    })
})

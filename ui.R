
library(shiny)
attach(USArrests)
data1 <- USArrests
# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Murder in relation to urban population"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
       sliderInput(inputId = "popin",
                   " Urban Population in percent",
                   min = 39,
                   max = 92,
                   value = 10),
       submitButton("Submit"),
       helpText("This application was made with the USArrest dataset and predicts the relation between Urban Population and murder.
Using the slider panel you can predict (not that weell) the murder in USA given a certain percent of Urban popultation.
 You can read the result via the red point on the plot, and the text output under the plot")
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),

    h4("Prediction of murder in relation to  urban popultion in percent"),
    textOutput("predict")
    )
  )
))

library(shiny)
library(tidyverse)


ui<-fluidPage(
  sliderInput(inputId = "num", # ID name for the input
                          label = "Choose a number", # Label above the input
                          value = 25, min = 1, max = 100  # values for the slider
              ),
  textInput(inputId = "title", # new Id is title
            label = "Write a title",
            value = "Histogram of Random Normal Values"), # starting title

plotOutput("hist"),
verbatimTextOuput("stats")
)

server<-function(input,output){
  output$hist <- renderPlot({
    # {} allows us to put all our R code in one nice chunck
    data<-tibble(x = rnorm(input$num)) # 100 random normal points
    ggplot(data, aes(x = x))+ # make a histogram 
      geom_histogram()+
      labs(title= input$title) #adding new title
})
}
output$stats <- rednderPrint({
  summary(rnorm(input$num))
})
shinyApp(ui = ui, server = server)

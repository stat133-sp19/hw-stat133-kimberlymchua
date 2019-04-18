library(shiny)
# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel("E-Z Invest"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("draws",
                  "Number of repetitions:",
                  min = 1,
                  max = 5000,
                  value = 1000),
      br(), 
      sliderInput("probs",
                  "Threshold for choosing boxes:",
                  min = 0,
                  max = 1,
                  value = 0.1), 
      br(), 
      numericInput("seed", "Choose a random seed:", 12345, min = 1, max = 12345),
      verbatimTextOutput("value")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot")
    )
  )
)

future_value <- function(amount, rate, years){
  FV <- amount * (1 + rate)^years
  return(FV)
}

annuity <- function(contrib, rate, years){
  ann <- contrib * ((((1 + rate)^years) - 1) / rate)
  return(ann)
}

growing_annuity <- function(contrib, rate, growth, years){
  FVGA <- contrib * ((((1 + rate)^years) - (1+growth)^years))/ (rate - growth)
  return(FVGA)
}


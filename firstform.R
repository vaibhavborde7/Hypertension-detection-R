# Load the shiny library
library(shiny)

# Define the UI for the application
ui <- fluidPage(
  
  # Application title
  titlePanel("Simple Input Form"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    sidebarPanel(
      # Input form elements
      textInput("name", "Enter your name:", ""),
      numericInput("age", "Enter your age:", value = 18, min = 0, max = 150),
      selectInput("gender", "Select your gender:",
                  choices = c("Male", "Female", "Other"), selected = "Male"),
      actionButton("submit", "Submit")
    ),
    mainPanel(
      # Output to display the submitted data
      textOutput("output")
    )
  )
)

# Define the server logic for the application
server <- function(input, output) {
  
  # Function to render the output based on input values
  output$output <- renderText({
    paste("Hello,", input$name, "! You are", input$age, "years old and your gender is", input$gender)
  })
}

# Run the application
shinyApp(ui = ui, server = server)


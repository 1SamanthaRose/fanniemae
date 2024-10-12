library(shiny)
library(ggplot2)
library(dplyr)
library(leaflet)

# Sample housing data
housing_data <- data.frame(
  county = c("County A", "County B", "County C", "County D"),
  median_home_price = c(300000, 250000, 400000, 350000),
  median_rent = c(1200, 1000, 1500, 1300),
  population = c(50000, 30000, 80000, 60000)
)

# Define UI for the app
ui <- fluidPage(
  titlePanel("Housing Data by County"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("county", "Select County:", 
                  choices = housing_data$county),
      radioButtons("data_type", "Select Data Type:",
                   choices = c("Median Home Price" = "median_home_price",
                               "Median Rent" = "median_rent",
                               "Population" = "population"))
    ),
    
    mainPanel(
      plotOutput("dataPlot"),
      leafletOutput("mapPlot")
    )
  )
)

# Define server logic for the app
server <- function(input, output) {
  
  # Filter data based on input$county
  selected_data <- reactive({
    housing_data %>%
      filter(county == input$county)
  })
  
  # Plot data
  output$dataPlot <- renderPlot({
    data <- selected_data()
    
    ggplot(data, aes_string(x = "county", y = input$data_type)) +
      geom_bar(stat = "identity", fill = "steelblue") +
      labs(y = input$data_type, x = "County") +
      theme_minimal()
  })
  
  # Show a map (this is a placeholder map)
  output$mapPlot <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addMarkers(lng = -93.85, lat = 42.01, popup = input$county)  # Sample coordinates
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
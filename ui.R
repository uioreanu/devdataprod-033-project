shinyUI(bootstrapPage(

    titlePanel("Time Series Decomposition"),
    sidebarLayout(
      sidebarPanel(
          # adding the new div tag to the sidebar            
          tags$div(class="header", checked=NA,
                   tags$p("A small reactive example for using decomposition of time series into seasonal, trend and irregular components:"),
                   tags$a(href="https://stat.ethz.ch/R-manual/R-devel/library/stats/html/decompose.html", "stats::decompose()"),
                   tags$p("")),
        selectInput(inputId = "data",
                    label = "Please select dataset",
                    choices = c(
                            'Airline Passenger 1949-1960' = 'AirPassengers', 
                            'Nottingham Temperatures 1920-1939' = 'nottem', 
                            'Monthly Sunspots 1749-Present' = 'sunspot.month')),
        
        checkboxInput(inputId = "show_figure",
                      label = strong("Show figure plot"),
                      value = FALSE),
        
        checkboxInput(inputId = "show_decomposition",
                      label = strong("Show Decomposition plot using moving averages"),
                      value = TRUE),
    
        checkboxInput(inputId = "show_forecast",
                      label = strong("Show Time Series Forecast using ARIMA"),
                      value = FALSE),
        verbatimTextOutput("dataset_txt"),
        
        tags$a(href="https://github.com/uioreanu/devdataprod-033-project/", "R source code on github")
        
      ),
      mainPanel(
          plotOutput(outputId = "figure_plot", height = "500px", width = "750px")
         
      )
    )

))

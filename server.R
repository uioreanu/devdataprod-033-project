shinyServer(function(input, output) {

    # fetch dataset
    data <- reactive({ 
        validate(
            need(input$data != "", "Please select a time series dataset")
        )
        get(input$data, 'package:datasets') 
    })
    
    output$dataset_txt <- renderText({
        paste("Dataset", input$data, "with", length(data()), "elements")
    })
    
    # prepare figure plot
    output$figure_plot <- renderPlot({
        # decompose ts data
        tsData = data()
        tsDecomp = decompose(tsData)

        if (input$show_figure) {
            plot(tsDecomp$figure, type="b", xaxt="n", xlab="", main=paste(input$data, " Figure Plot"))
            # get names of 12 months in English words
            monthNames <- months(ISOdate(2011,1:12,1))
            # label x-axis with month names
            axis(1, at=1:12, labels=monthNames, las=2)
        }

        if (input$show_decomposition) {
            # plot the time series decomposed into its components
            plot(tsDecomp)        
        }
        if (input$show_forecast) {
            # plot the time series forecast using decomposition
            fit <- arima(tsData, order=c(1,0,0), list(order=c(2,1,0), period=12))
            fore <- predict(fit, n.ahead=24)
            # error bounds at 95% confidence level
            U <- fore$pred + 2*fore$se
            L <- fore$pred - 2*fore$se
            ts.plot(tsData, fore$pred, U, L, col=c(1,2,4,4), lty = c(1,1,2,2))
            legend("topleft", c("Actual", "Forecast", "Error Bounds (95% Confidence)"), col=c(1,2,4), lty=c(1,1,2))
        }
        
    })

    output$table <- renderTable({
        head(data())
    })
    
})

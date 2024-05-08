library(shiny)

function(input, output, session) {

    output$distPlot <- renderPlot({
      
        if (input$distribution == "Normal") {
          samples <- rnorm(input$sampleSize * input$simulations, mean = input$mean)
          output$theoriticalMean <- renderText(paste("Theoritical Mean is " , input$mean))
        } else if (input$distribution == "Exponential") {
          samples <- rexp(input$sampleSize * input$simulations, input$mean)
          output$theoriticalMean <- renderText(paste("Theoritical Mean is " , round(1 / input$mean, 4)))
        } else {
          samples <- rpois(input$sampleSize * input$simulations, input$mean)
          output$theoriticalMean <- renderText(paste("Theoritical Mean is " , input$mean))
        } 
        
        
        simulations <- matrix(data=samples, nrow=input$simulations, ncol = input$sampleSize)
        
        # Computing mean of all the simulations
        mean_vector <- apply(simulations, 1, mean)
        output$sampleMean <- renderText(paste("Sample Mean is ", round(mean(mean_vector), 4)))

        # generate bins based on input$bins from ui.R
        bins <- seq(min(mean_vector), max(mean_vector), length.out = input$bins + 1)
        
        lambda <- input$mean
        hist(mean_vector, 
             breaks = bins, 
             prob = TRUE, 
             col="lightblue",
             main = paste(paste('Means of ', input$distribution), " distributions simulations"), 
             xlab = "Spread")
        lines(density(mean_vector))
        abline(v = lambda, col = "red")
        xfit <- seq(min(mean_vector), max(mean_vector), length = 100)
        yfit <- dnorm(xfit, mean = lambda)
        abline(v = mean(mean_vector), col = "orange", pch=22)
        legend('topright', c("Simulation", "Theoretical Values"), 
               bty = "n", lty = c(1,2), col = c("orange", "red"))

    })

}

library(shiny)

fluidPage(

    # Application title
    titlePanel("Simulation of Central Limit Theorem & Law of Large Numbers"),
    p("This applications demonstrates Central Limit Theorem and Law of large numbers with simulation experiments"),
    strong("Central Limit Theorem:"),
    p("The Central Limit Theorem in Statistics states that as the sample size increases and its variance is finite, then the distribution of the sample mean approaches normal distribution irrespective of the shape of the population distribution."),
    strong("Law of Large Numbers"),
    p("The law of large numbers (LLN) is a mathematical theorem that states that the average of the results obtained from a large number of independent and identical random samples converges to the true value."),
    br(),
    p("In this app we will simulate this for various distributions specifying lambda for the distribution, sample sizes and number of simulations, we notice that as the sample size and number of simulation gets larger the distribution of sample means is identical to a normal distribution and the sample mean converges to the theoritical mean."),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput(
              "distribution",
              "Select Distribution",
              choices=c("Normal", "Exponential", "Poissons"),
              selected = "Normal",
            ),
            sliderInput("mean",
                        "Lambda:",
                        min = 1,
                        max = 30,
                        value = 10),
            sliderInput("sampleSize",
                      "Sample Size:",
                      min = 10,
                      max = 100,
                      value = 50),
            sliderInput("simulations",
                        "Number of Simulations:",
                        min = 100,
                        max = 10000,
                        value = 1000),
            sliderInput("bins",
                        "Number of bins:",
                        min = 10,
                        max = 100,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            textOutput("theoriticalMean"),
            textOutput("sampleMean")
        )
    )
)

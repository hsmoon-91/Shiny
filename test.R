library(shiny)

sales <- readr::read_csv("G:/내 드라이브/r_shiny/test0208/sales_data_sample.csv", na="")
sales <- sales[c("TERRITORY","ORDERDATE","ORDERNUMBER","PRODUCTCODE",
                 "QUANTITYORDERED","PRICEEACH")]
# unique(sales$TERRITORY)


# Define UI for application
ui <- fluidPage(

    # Application title
    titlePanel("Sales data"),
    
    selectInput("territory","territory", choices = unique(sales$TERRITORY)),
    tableOutput("selected")
)

# Define server
server <- function(input, output) {
    # selected <- reactive(sales[sales$TERRITORY == input$territory, ])
    
    selected <- reactive({

        # browser()
        # subset(sales, TERRITORY %in% input$territory)
        
        if(input$territory == "NA") {
            subset(salse, is.na(TERRITORY))
        } else {
            subset(sales, TERRITORY == input$territory)
        }
    })
    output$selected <- renderTable(head(selected(), 10))

}

# Run the application 

shinyApp(ui = ui, server = server, options = list(launch.browser = TRUE))

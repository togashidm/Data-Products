library("shiny")
library("shinyIncubator")
library("polynom")

df <- data.frame(matrix(c("0","0"), 1, 2))

shinyUI(
        fluidPage(
                
                headerPanel('PoliFit'),
                
                sidebarPanel(
                        
                        textInput(inputId="degree", label = "Polynomial degree (n):",1),
                        
                        wellPanel(
                                h3("Input Data"),
                                matrixInput(inputId = 'data', label = 'Add or Remove (x,y)', data = df)
                        ),
                        actionButton("go", "Go")
                ),
                
                mainPanel(
                        
                        tags$style(type="text/css",
                                   ".shiny-output-error { visibility: hidden; }",
                                   ".shiny-output-error:before { visibility: hidden; }"
                        ),
                        
                        
                        tabsetPanel(
                                
                                tabPanel("Data Plot", plotOutput("scatterPlot"),
                                         column(6,em(textOutput("r2")), align = "center"),
                                         column(6,em(textOutput("adjr2")), align = "center")
                                ),
                                tabPanel("Residuals", plotOutput("residualPlot")), 
                                tabPanel("Predicted Values",tableOutput("prediction")),
                                tabPanel("Coefficient Values",verbatimTextOutput("coef")),
                                tabPanel("Model Summary", verbatimTextOutput("summary")),
                                tabPanel("About my App", 
                                        br(),
                                        withMathJax(),
                                        h3("Description"),
                                        p("This small Shiny application enables you to manually input 
                                           data points (x,y), plot the points, fit and plot the best 
                                           polynomial curve of the choosen degree n through your data points."),
                                        br(),
                                        h3("Features"),
                                        p("The application will fit the best polynomial function of
                                           degree",strong("n"),":"),
                                        br(),
                                        p("$$f(x)= a_0 + a_1x + a_2x^2 + ... + a_nx^n$$"),
                                        br(),
                                        p("The results are presented in five different formats:"),
                                        br(),
                                        p("* Data Plot"),
                                        p("* Residuals Plot"),
                                        p("* Coefficient Values \\(\\ a_0, a_1,.., a_n\\)"),
                                        p("* Model Summary (a more complete information from the model)"),
                                        br(),
                                        h3("Procedure"),
                                        p("The first input value is the (0,0) point which can be modified by clicking on the
                                                values in the input data table. 
                                          More points can be added by introducing
                                          the values in the Input Data table. Click on", strong("(+)"),"to add or", 
                                          strong("(-)"), "to delete a row in the table.
                                          When you are satistified with all the input data, 
                                          click on", strong("Go"),"button. You will see the points on the plot and
                                          the best curve that fits these points."),
                                        p("The default value for the polynomial degree is n=1, i.e., it uses a linear model.
                                          The degree n can be changed and other polynomials can be evaluated. "),
                                        br(),
                                        h3("Important"),
                                        p("A limitation of the fitting process is the relationship 
                                                between n and the number of data points.", em(strong("You can only fit 
                                                a polynomial function with degree n using at least n + 2 data points.")), 
                                                "For example, you will need to input at least three points to use a linear model."),
                                        p("This application was not optimized for mobile devices."),
                                        br(),
                                        # p("For ui.R and server.R visit my github ",
                                        # a("here.", 
                                        #     href = "http://github.com/anonymous-1618/data-products"),
                                        h3("Resources used to build this App"),
                                        p("* For shiny apps look at", a("shiny", href="http://shiny.rstudio.com/tutorial/")),
                                        p("* For the Input data look at", a("shinyTable", href="https://github.com/trestletech/shinyTable")),
                                        p("* For the Polynomial functions look at", a("polynom", href ="https://cran.r-project.org/web/packages/polynom/polynom.pdf")),
                                        p("* For the fitting method look at", a("Fitting", href="https://www.r-bloggers.com/fitting-polynomial-regression-in-r/")),
                                        br(),
                                        p("I hope you like it!!"),
                                        br(),
                                        br(),
                                        p(em("Created by DT on Sept 1st 2016"), align="right")
                                        
#                                        ) 
                                        
                                )
                                
                        )
                        
                )
        )       
)

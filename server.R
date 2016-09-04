shinyServer(
        function(input, output) {
                
                inputVals <- eventReactive(input$go,input$data)
                
                model <- reactive({
                        
                        yval <- inputVals()[,2]
                        xval <- inputVals()[,1]
                        n <- input$degree
                        x <- poly(xval,n, raw = TRUE)
                        lm(yval ~ x)
                })
                
                simVector <- reactive({
                         xmax <- max(inputVals()[,1])
                         xmin <- min(inputVals()[,1])
                         npoints <- as.numeric(length(inputVals()[,1]))
                         d <- (xmax-xmin)/(10*npoints-1)
                         seq(xmin,xmax,d)
                })
                 
                simFun <- reactive({
                         p <- as.polynomial(model()$coefficients)
                         f <- as.function(p)
                         f(simVector())
                })
                 
                output$summary <- renderPrint( summary(model()) )
        
                output$scatterPlot <- renderPlot({
                        plot(inputVals(),xlab="x values",ylab = "y values",pch=20,cex=2.5, col="#377EB8")
                        lines(x=simVector(),y=simFun(), col="#E41A1C")
                })

                output$residualPlot <- renderPlot({
                        plot(sort(inputVals()[,1]),
                             residuals(model())[order(inputVals()[,1])],
                             xlab="x values",ylab = "Residuals",
                             pch=20,cex=2.5, col="#4DAF4A",type="b")
                        abline(h=0, col="#E41A1C",lty=3)
                })
                
                output$prediction <-   renderTable({
                        pred <- cbind(inputVals(),fitted(model()),summary(model())$residuals)
                        colnames(pred)<-c("x","y","yFit","residuals")
                        pred
                })
                
                output$r2 <- renderText(
                        paste('r^2 =',round(summary(model())$r.squared,4))
                )
                
                output$adjr2 <- renderText(
                        paste('r^2(adj) =',round(summary(model())$adj.r.squared,4))
                )
                
                output$coef <- renderPrint(
                        round(summary(model())$coef,3)
                )
        }
)


#       Ensure that you have the following packages:
#
#       install.packages("devtools")
#       install_github("trestletech/shinyTable")
#       install.packages("polynom")
#
#       more information about shinyIncubator at:
#       https://github.com/trestletech/shinyTable
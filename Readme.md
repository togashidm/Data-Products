# PoliFit

## Description
This small Shiny application enables you to manually input
data points (x,y), plot the points, fit and plot the best 
polynomial curve of the choosen degree n through your data points.

## Features
The application will fit the best polynomial function of degree **n**:

f(x)= a0 + a1*x + a2*x^2 + ... + an*x^n

The results are presented in five different formats:

* Data Plot
* Residuals Plot
* Coefficient Values (a0, a1,..., an)
* Model Summary (a more complete information from the model)

## Procedure:
The first input value is (0,0) point which can be modified by click on the
values in the input data table. More points can be added by introducing
the values in the Input Data table. Click on **"+"** to add or **"-"** to delete a row
in the table. When you are satistified with all the input data, 
click on **"Go"** button. You will see the points on the plot and
the best curve that fits on these points.
The default value for the polynomial degree is n=1, i.e., it uses a linear model.
The degree n can be change and other polynomials can be evaluated.

## Important:
A limitation of the fitting process is the relationship between n and number of data points.
*You can only fit a polynomial function with degree n by using at least n + 2 data points.*
For example, you will need to input at least three points to use a linear model

you can access the app here:
https://rpubs.com/DMT/206376

I hope you like it!!
Created by DT on Sept 2016

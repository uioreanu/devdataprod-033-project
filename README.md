---
title       : Time Series Decomposition
subtitle    : using R stats::decompose() function
author      : Calin Uioreanu
job         : Developing Data Products Course Project
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Summary

This is a short presentation for the course project shiny application. We have chosen **Time series decomposition**, a hot topic in data mining.

Our goals:

- create a [shiny](http://shiny.rstudio.com/) application.
- publish it on the Web using shinyapps.io.
- create a presentation using the [slidify library](http://slidify.org/)
- publish it on rpubs and cross-link.

Time Series Decomposition using R's [stats::decompose()](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/decompose.html) function and default time series datasets, as well as forecasting using arima.

--- .class1 #id1

## Datasets
We make use of R's base package stats time series datasets.

```{r}
(data()$results[1,c(3:4)])
```

We have picked the [AirPassengers](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/AirPassengers.html), [nottem](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/nottem.html) and [sunspots](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/sunspot.month.html) Time Series.
```{r}
length(AirPassengers)
```

--- .class #id 
## Decomposition using R decompose() function

R's powerful time series decomposition tools allow the separation into seasonal, trend and irregular components. The [stats::decompose()](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/decompose.html) function uses moving averages

```{r}
plot(decompose(nottem))
```

--- .class #id 
## Forecasting using R arima() and predict() functions


Our goal is to predict a 2 years period using RÂ´s [predict.Arima()](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/predict.arima.html) function.
We use R's arima (Autoregressive Integrated Moving Average) modeling to create a statistical model for the irregular component of time series. We use a basic order of (1,0,0) for the arima model and define the periodicity (monthly data, 12). We then make use of the predict function, plot the forecast together with the 95% Confidence Interval.

```{r}
arima(AirPassengers, order=c(1,0,0))
```

--- .class #id6 bg:yellow
## Final slide

And finaly, the links to the Shiny Web Application: 
- [Time Series Decomposition](https://calin.shinyapps.io/devdataprod-033-project), 
- the [R source code](https://github.com/uioreanu/devdataprod-033-project) hosted on github.

An alternative is to use the [stats::stl()](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/stl.html) Seasonal Decomposition of Time Series by Loess function.


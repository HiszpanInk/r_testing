rm(list=ls())
gc()
library(data.table)
library(ggplot2)
data <- fread("stats2.csv")
monthsUsed <- as.character(data$Miesiąc)
yearsUsed <- as.character(data$Rok)

i <- 1
monthsForChart <- c()

for(month in monthsUsed){
    newName <- paste(month, "\n", yearsUsed[i])
    monthsForChart <- c(monthsForChart, newName)
    i <- i + 1
}


df <- data.frame(month = monthsForChart, passengersNum = as.character(data$LiczbaPasazerow), stringsAsFactors = FALSE)
str(df)
testPlot <- ggplot(df,aes(factor(month, monthsForChart), passengersNum)) + geom_point() 

ggsave(file="plot.png", width=10, height=4, dpi=300)
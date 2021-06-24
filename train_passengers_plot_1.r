rm(list=ls())
gc()

library(data.table)
library(ggplot2)
library(bbplot)

data <- fread("stats2.csv")
monthsUsed <- as.character(data$Miesiąc)
yearsUsed <- as.character(data$Rok)
numbersUsed <- data$LiczbaPasazerow

i <- 1
monthsForChart <- c()
numbersMainList <- c()

for(month in monthsUsed){
    newName <- paste(month, "\n", yearsUsed[i])
    monthsForChart <- c(monthsForChart, newName)
    newNumber <- as.numeric(sub(",", ".", numbersUsed[i]))

    numbersMainList <- c(numbersMainList, newNumber)
    i <- i + 1
}


df <- data.frame(month = monthsForChart, passengersNum = numbersMainList, stringsAsFactors = FALSE)
str(df)
testPlot <- ggplot(df,aes(factor(month, monthsForChart), passengersNum, group = 1)) + 
geom_line(colour = "#1380A1", size = 2) + 
geom_point() + 
labs(y = "Liczba pasażerów(w mln)", x = "Miesiąc\nrok", title="Pasażerowie pociągów pasażerskich", subtitle = "Liczba pasażerów na kolei w okresie styczeń 2019 - kwiecień 2021 (w milionach)") + 
bbc_style() +
geom_hline(yintercept = 0, size = 1, colour="#333333")

ggsave(file="plot.png", width=34, height=4, dpi=600)

finalise_plot(plot_name = testPlot,
              source = "Źródło: UTK",
              save_filepath = "plot2.png",
              width_pixels = 2400,
              height_pixels = 500)

rm(list=ls())
gc()

library(extrafont)
loadfonts(device = "win")
library(ggplot2)
library(bbplot)

data_1 <- cbind(c(1, 10), c(0, 1))

colnames(data_1) <- c("cor_x", "cor_y")
data_df <- as.data.frame(data_1)
head(data_df)

testPlot <- ggplot(data_df, aes(x=cor_x, y=cor_y)) + geom_point(size=4, shape=16) + 
geom_smooth(method = "lm", se = FALSE, size=2) + 
scale_y_continuous(breaks=c(0,1)) + scale_x_continuous(breaks=c(1,10)) +
labs(title="Korelacja między\nposiadaniem anime lub azjatyckiego wokalisty na zdjęciu profilowym na Twitterze\nz\ndysfunkcjami mózgowymi i pisaniem głupot związanych z ograniczeniem intelektualnym", x = "Szansa na posiadanie\ndysfunkcji mózgowych\ni\nszansa na pisanie głupot\nwynikających z ograniczenia intelektualnego", y="Posiadanie\nanime lub azjatyckiego wokalisty\nna zdjęciu profilowym na Twitterze") +
theme(axis.text = element_text(size = 16)) + theme(axis.title = element_text(size = 16)) + theme(plot.title = element_text(size = 20)) + theme(plot.title = element_text(hjust = 0.5)) +
theme(text=element_text(family="Comic Sans MS"))
finalise_plot(plot_name = testPlot,
              source = "Źródło danych: IDZD",
              save_filepath = "plot2.png",
              width_pixels = 1000,
              height_pixels = 1000,
              logo_image_path = 'idzd.png')

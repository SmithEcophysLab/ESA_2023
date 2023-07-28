# c4_fig.R
## create a simple c4 figure for ESA 2023 talk

## libraries
library(tidyverse)

## source model
source('../../../optimal_vcmax_R/calc_optimal_vcmax.R')
sourceDirectory('../../../optimal_vcmax_R/functions')

## run model
c4_co2 <- calc_optimal_vcmax(pathway = "C4", cao = seq(400, 1000, 50))
c4_temp <- calc_optimal_vcmax(pathway = "C4", tg_c = seq(16, 40, 2))

## make figures
ndemand_co2_plot <- ggplot(aes(x = cao, y = nphoto), data = c4_co2) +
  theme(legend.position = "right",
        plot.title = element_text(size = rel(2.2)),
        legend.title = element_text(size = rel(1.5)),
        legend.text = element_text(size = rel(1.5)),
        plot.tag = element_text(size = rel(2)),
        axis.title.y=element_text(size=rel(2.2), colour = 'black'),
        axis.title.x=element_text(size=rel(2.2), colour = 'black'),
        axis.text.x=element_text(size=rel(2), colour = 'black'),
        axis.text.y=element_text(size=rel(2), colour = 'black'),
        panel.background = element_rect(fill = 'white', colour = 'black'),
        panel.grid.major = element_line(colour = "grey")) +
  geom_line(col = 'darkorange', linewidth = 3) +
  ylim(0, 1.5) +
  ylab(expression('C'[4] * ' photosynthetic N demand')) +
  xlab(expression('CO'[2] * ' (ppm)'))

ndemand_temp_plot <- ggplot(aes(x = tg_c, y = nphoto), data = c4_temp) +
  theme(legend.position = "right",
        plot.title = element_text(size = rel(2.2)),
        legend.title = element_text(size = rel(1.5)),
        legend.text = element_text(size = rel(1.5)),
        plot.tag = element_text(size = rel(2)),
        axis.title.y=element_text(size=rel(2.2), colour = 'black'),
        axis.title.x=element_text(size=rel(2.2), colour = 'black'),
        axis.text.x=element_text(size=rel(2), colour = 'black'),
        axis.text.y=element_text(size=rel(2), colour = 'black'),
        panel.background = element_rect(fill = 'white', colour = 'black'),
        panel.grid.major = element_line(colour = "grey")) +
  geom_line(col = 'darkorange', linewidth = 3) +
  ylim(0, 1.5) +
  ylab(expression('C'[4] * ' photosynthetic N demand')) +
  xlab('Temperature (°C)')

jpeg(filename = "c4_co2.jpeg", 
     width = 5, height = 6, units = 'in', res = 300)
plot(ndemand_co2_plot)
dev.off()

jpeg(filename = "c4_temp.jpeg", 
     width = 5, height = 6, units = 'in', res = 300)
plot(ndemand_temp_plot)
dev.off()

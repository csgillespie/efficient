library(ggplot2)
library(memoise)
library(microbenchmark)
plot_mpg = function(row_to_remove) {
  data(mpg, package = "ggplot2")
  mpg = mpg[-row_to_remove, ]
  plot(mpg$cty, mpg$hwy)
  lines(lowess(mpg$cty, mpg$hwy), col = 2)
}

m_plot_mpg = memoise(plot_mpg)
z = microbenchmark(times = 10, unit = "ms", m_plot_mpg(10), plot_mpg(10))
z$time = z$time/10^9
z$expr = factor(z$expr, labels=c("Standard", "memoise"))

res=300
png("vignettes/graphics/sol3_memoise.png", width=6*res, height=4*res, res=res)
g = ggplot(z) +
  geom_violin(aes(expr, time),position=position_dodge(0.9), bg="steelblue") +
  scale_y_continuous(limits=c(10^-6, 10^-1), expand=c(0, 0), breaks = 10^(-6:-1),
                     trans="log10",
                     labels=c(expression(10^-6),expression(10^-5),
                              expression(10^-4),expression(10^-3),
                              expression(10^-2),expression(10^-1)))

g1 = g +  labs(title = "Performance gains with memoise",
               x = NULL, y = "Elapsed time (secs)",colour = NULL, fill = NULL) +
  theme(panel.grid.major.y = element_line(colour = "gray90"),
        panel.grid.minor = element_line(colour = NA),
        panel.grid.major.x = element_line(colour = NA),
        plot.title = element_text(size = 12,
                                  face = "bold", hjust = 1, vjust = 0),
        panel.background = element_rect(fill = NA),
        legend.background = element_rect(fill = NA),
        legend.position = c(0.93, 0.92),
        axis.ticks.x = element_line(linetype = "blank"),
        axis.ticks.y = element_line(linetype = "blank"))
print(g1)
dev.off()
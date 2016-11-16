monte_carlo = function(N) {
  hits = 0
  for (i in seq_len(N)) {
    u1 = runif(1)
    u2 = runif(1)
    if (u1 ^ 2 > u2)
      hits = hits + 1
  }
  return(hits / N)
}

monte_carlo_vec = function(N) sum(runif(N)^2 > runif(N))/N

n_s = seq(1, 4, length.out=8)
m = matrix(0, ncol=2, nrow = length(n_s))
for(i in seq_along(n_s)) {
  N = 10^(n_s[i])
  z = microbenchmark(monte_carlo(N), monte_carlo_vec(N), unit = "ms", times=500)
  z$time = z$time/10^9
  m[i,] = tapply(z$time, z$expr, mean)
}

dpi = 300
png("vignettes/graphics/sol3_monte_carlo.png", width=6*dpi, height=4*dpi, res = dpi)
par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')

plot(10^n_s, m[,1]/m[,2], log="x", type="l", axes=F, frame=FALSE, 
     xlab = "N", ylab="Relative time", ylim=c(0, 80), 
     panel.first = abline(h=seq(0, 80, 20), lty=1, col="grey90"), 
     col="steelblue", lwd=2)

axis(2, tick=FALSE,  col.axis="grey50", cex.axis = 0.8)
axis(1, at = 10^(1:4), 
     labels=c(expression(10^1), expression(10^2), expression(10^3), expression(10^4)), 
     tick=FALSE,  col.axis="grey50", cex.axis = 0.8)


## Title
title("Monte-Carlo: vectorised vs standard", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")

dev.off()


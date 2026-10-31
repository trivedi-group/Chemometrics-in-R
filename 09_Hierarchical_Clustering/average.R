# Use the lesson's own x and y, even when swirl runs this script from inside a function that has its own x.
x <- get("x", envir = globalenv())
y <- get("y", envir = globalenv())
par(mar=rep(0.1,4))
plot(x,y,col="blue",pch=19,cex=2)
points(mean(x[1:4]),mean(y[1:4]),col="orange",pch=3,lwd=3,cex=3)
points(mean(x[5:8]),mean(y[5:8]),col="orange",pch=3,lwd=3,cex=3)
points(mean(x[9:12]),mean(y[9:12]),col="orange",pch=3,lwd=3,cex=3)


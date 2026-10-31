# Use the lesson's own x and y, even when swirl runs this script from inside a function that has its own x.
x <- get("x", envir = globalenv())
y <- get("y", envir = globalenv())
segments(mean(x[1:4]),mean(y[1:4]),mean(x[5:8]),mean(y[5:8]),lwd=3,col="orange")
segments(mean(x[5:8]),mean(y[5:8]),mean(x[9:12]),mean(y[9:12]),lwd=3,col="orange")
segments(mean(x[1:4]),mean(y[1:4]),mean(x[9:12]),mean(y[9:12]),lwd=3,col="orange")
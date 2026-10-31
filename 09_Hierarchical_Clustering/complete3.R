# Use the lesson's own x and y, even when swirl runs this script from inside a function that has its own x.
x <- get("x", envir = globalenv())
y <- get("y", envir = globalenv())
segments(x[4],y[4],x[11],y[11],lwd=3,col="orange")

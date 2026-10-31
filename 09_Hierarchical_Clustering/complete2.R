# Use the lesson's own x and y, even when swirl runs this script from inside a function that has its own x.
x <- get("x", envir = globalenv())
y <- get("y", envir = globalenv())
points(x[11],y[11],col="orange",pch=3,lwd=3,cex=3)
segments(x[8],y[8],x[11],y[11],lwd=3,col="orange")

# Use the lesson's own x and y, even when swirl runs this script from inside a function that has its own x.
x <- get("x", envir = globalenv())
y <- get("y", envir = globalenv())
par(mar=c(0,0,0,0))
plot(x,y,col="blue",pch=19,cex=2,asp=1)
text(x+0.05,y+0.05,labels=as.character(1:12))

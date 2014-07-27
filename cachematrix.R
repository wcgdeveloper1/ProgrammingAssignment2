## Functions that return inverse of matrix. Utilizes saved, cached value if found

## Manages special matrix object
makeCacheMatrix <- function(x = matrix()) {
m<-NULL
set<-function(y){
x<<-y
m<<-NULL
}
get<-function() x
setmatrix<-function(mat) m<<- mat
getmatrix<-function() m
list(set=set, get=get,
setmatrix=setmatrix,
getmatrix=getmatrix)
}


## Gets cached matrix if found. Otherwise, inverses matrix, caches it, and
## returns it

cacheSolve <- function(x, ...) {
m<-x$getmatrix()
if(!is.null(m)){
message("getting cached matrix")
return(m)
}
matrix <- x$get()
m<-solve(matrix, ...)
x$setmatrix(m)
m
}
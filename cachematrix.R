## The following are a pair of functions that cache the inverse of a matrix.

## The 'makeCacheMatrix' function creates a special "matrix" object that can
## cache its inverse

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y) {
x <<- y
m <<- NULL
}
get <- function () x
## The following code caches the inverse matrix.
setinverse <- function(solve) m <<- solve
## The following code returns the inverse matrix.
getinverse <- function() m
list (set = set, get = get,
setinverse = setinverse,
getinverse = getinverse)
}

## The 'cacheSolve' function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse has already been
## calculated (and the matrix has not changed), then the cachesolve should
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
m <- x$getinverse()
## If the inverse matrix has been calculated and cached, the following
## code returns a note and the cached inverse matrix.
if(!is.null(m)) {
message("getting cached data")
return(m)
}
## If the inverse matrix has not been calculated and, therefore, not cached,
## the following code calculates and stores/caches the inverse matrix.
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
}
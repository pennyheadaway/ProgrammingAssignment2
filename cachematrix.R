## functions to cache and invert a matrix


## makeCacheMatrix: This function creates a special "matrix" object that can 
##                  cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    
    set <- function(y) {
        x <<- y
        inverse <- NULL
    }
    get <- function() x
    setInverse <- function(inv) inverse <<- inv
    getInverse <- function() inverse
    
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## cacheSolve:  This function computes the inverse of the special "matrix" 
##              returned by makeCacheMatrix above. If the inverse has already 
##              been calculated (and the matrix has not changed), then 
##              cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
    inverse <- x$getInverse()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    data <- x$get()
    inverse <- solve(data, ...)
    x$setInverse(inverse)
    ## Return a matrix that is the inverse of 'x'
    inverse
}

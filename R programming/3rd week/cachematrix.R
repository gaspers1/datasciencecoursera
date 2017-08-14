# makeCacheMatrix receives a 2x2 matrix, and sets functions in memory, 
# and returns a list of 4 functions.

makeCacheMatrix <- function(x = numeric()) {
    
    localmatrix <- NULL         # First build set function, which stores matrix (passed via x)
    set <- function(y) {        
        x <<- y
        localmatrix <<- NULL    # Set localmatrix var to NULL at start, so we will know if cacheSolve has run at least once
    }
    
    get <- function() x         # Create function to get matrix, which was passed via set function
    setcachemat <- function(inverse) localmatrix <<- inverse      # Create function to set the value of localmatrix to inverse
    getcachemat <- function() localmatrix      # Create function to get value from localmatrix
    
    list(set = set, get = get, setcachemat = setcachemat, getcachemat = getcachemat)
    
}

# cacheSolve function gets a matrix defined in m from makeCacheMatrix() and returns the inverted form of the submitted matrix.

cacheSolve <- function(x, ...) {
    
    m <- x$getcachemat()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()
    m <- solve(data)    # solve function returns inverted matrix
    x$setcachemat(m)
    m
}


# Testing:

m <- makeCacheMatrix()
m$set(matrix(c(0,2,2,0),2,2))
m$get()
cacheSolve(m)
cacheSolve(m)

# Change of matrix builds new solution:

m$set(matrix(c(100,2,2,100),2,2))
m$get()
cacheSolve(m)
cacheSolve(m)

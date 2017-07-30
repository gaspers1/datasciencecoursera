makeCacheMatrix <- function(cachematrix = numeric()) {
    
    localmatrix <- NULL
    
    set <- function(y) {
        cachematrix <<- y
        localmatrix <<- NULL
    }
    
    get <- function() cachematrix
    
    setcachemat <- function(inverse) localmatrix <<- inverse
    
    getcachemat <- function() localmatrix
    
    list(set = set, get = get, setcachemat = setcachemat, getcachemat = getcachemat)
    
}

cachematrix <- function(x, ...) {
    
    m <- x$getcachemat()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()
    m <- solve(data)
    x$setcachemat(m)
    m
}




m <- makeCacheMatrix()
m$set(matrix(c(0,2,2,0),2,2))
m$get()
cachematrix(m)
cachematrix(m)


# Testing both functions

s <- makeCacheMatrix(matrix(c(1,2,12,13),2,2)
                    )

s$get()

s$getcachemat(m)  # this is only to show you that the mean has been stored and does not affect anything

cacheSolve(s)


s$set(c(10,20,30,40))

s$getcachemat()



cachemean(a)

a$get()

a$setmean(0)  # do NOT call setmean() directly despite it being accessible for the reason you will see next

a$getmean()

a$get()

cachemean(a)

a <- makeVector(c(5, 25, 125, 625))

a$get()

cachemean(a)

cachemean(a)





# Benedict Olgado
#12-27-2017
# cachematrix.R
# example usage:
#> source("cachematrix.R")
#> aSquareMatrix <- makeCacheMatrix(matrix(0:8, 8, 8))
#> squareMatrix$getMatrix()
#> aSquareMatrix$getCache() # will return NULL for the 1st time
#> cacheSolve(aSquareMatrix)
#> aSquareMatrix$getCache() # will return the solution

	makeCacheMatrix <- function(x = matrix())
	{
  
  # 'makeCacheMatrix' 
  # makes a cache matrix from a given matrix
  # 1. initialize the cache Matrix 'cacheMatrix'
  # assign  NULL for the first run
  
	cacheMatrix <- NULL
  
  # 2. Set 'setMatrix'

	setMatrix <- function(y) {
	x <<- y
	cacheMatrix <<- NULL
 	}
  
  # 3. Set 'getMatrix'
  # return the matrix 'x'
  
	getMatrix <- function() x
  
  # 4. Set 'setCache'
  
	setCache <- function(inverse) cacheMatrix <<- inverse
  
  # 5. Set 'getCache'
  # that will return the cached inverse of 'x'
  
	getCache <- function() cacheMatrix
  
  # 6. list the names of all methods
  
	list(setMatrix = setMatrix,
	getMatrix = getMatrix,
	setCache = setCache,
	getCache = getCache) 
	}

	cacheSolve <- function(x, ...) {

  # 'cacheSolve'
  # return the inverse of a given matrix utilizing the cache

  # 1. check the content of cache matrix

	cacheMatrix <- x$getCache()

  # 2. if the content is not null then: return the result 
  
	if (!is.null(cacheMatrix)) {
  	message("loading cache matrix...")
	return(cacheMatrix)
	}
  
  # 3. if the content is empty then: 
  # get matrix, create, set, update and return the cache matrix

	else {
	dMatrix <- x$getMatrix()
	cacheMatrix <- solve(dMatrix, ...)
	x$setCache(cacheMatrix)
	return(cacheMatrix)
	}
	}

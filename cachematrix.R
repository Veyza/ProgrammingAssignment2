## functions allow to avoid extra computations of inverse matrixes
## the inverse matrix received once is keeping in cache untill
## the initial matrix changes

## The makeCacheMatrix create a list of functions 
## for setting and getting a matrix and its inverse

    makeCacheMatrix <- function(A = matrix()) {
	
	inv <- NULL
	
	set <- function(B) {
	    A <<- B
	    inv <<- NULL
	}
	get <-function() A
	setInv <- function(inverse) inv <<- inverse
	getInv <- function() inv
	
	list(set =set, get = get, setInv = setInv, getInv = getInv)
    
    }
    
    

## The cacheSolve get a list of functions described above, 
## return a matrix that is inverse of A
## the function would compute the inverse only if A changed
## else the function take inverse A from cache

    cacheSolve <- function(x, ...) {
        
        inv <- x$getInv()
	
        if(!is.null(inv)) {
	    message("getting cached data")
	    return(inv)
        }
    
	M <- x$get()
        inv <- solve(M)
        x$setInv(inv)
    
	inv

    }


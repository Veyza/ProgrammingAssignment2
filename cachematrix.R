## functions allow to avoid extra computations of inverse matrixes
## the inverse matrix received once is keeping in cache untill
## the initial matrix changes

## The makeCacheMatrix create a list of functions 
## for setting and getting a matrix and its inverse

    makeCacheMatrix <- function(A = matrix()) {
	
	inv <- NULL		## We don't know what is inverse
	
	set <- function(B) {	## after running set
	    A <<- B		## we have the matrix A
	    inv <<- NULL	## we don't know its inverse yet
	}
	get <-function() A				## take the A
	setInv <- function(inverse) inv <<- inverse	## set the inverse when we know it
	getInv <- function() inv			## get the inverse value or NULL
	
	list(set =set, get = get, setInv = setInv, getInv = getInv)	## return a list of functions
    
    }
    
    

## The cacheSolve get x that is a list of functions described above, 
## return a matrix that is inverse of A (also see above)
## the function would compute the inverse only if A changed
## else the function take inverse A from cache

    cacheSolve <- function(x, ...) {
        
        inv <- x$getInv()	## inverse value or NULL
	
        if(!is.null(inv)) {			## if inverse is known	
	    message("getting cached data")	## say that it is known
	    return(inv)				## return already known value
        }
    
	M <- x$get()				## else get a matrix
        inv <- solve(M)				## and compute its inverse
        x$setInv(inv)				## remember computed inverse matrix
    
	inv					## result

    }


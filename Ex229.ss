(define (make-mobile left right)
	(list left right))

(define (make-branch length structure)
	(list length structure))

(define (left-branch branch) (car branch))

(define (right-branch branch) (car (cdr branch)))

(define (branch-length branch) (car branch))

(define (branch-structure branch) (car (cdr branch)))

(define (total-weight branch)
	( if ((not (pair? (branch-structure branch))) branch-structure branch)
	(+ (total-weight (left-branch branch)) 
		(total-weight (right-branch branch)))


(define (square x) (* x x))

(define (square-tree tree)
	(map
	(lambda (sub-tree) (
		if (not (pair? sub-tree)) (square sub-tree)
			(square-tree sub-tree)) ) 
	 tree))



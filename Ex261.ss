(define (adjoin-set x set1)
	(cond
		((null? set1) '())
		((= x (car set1)) set1) 
		((< x (car set1)) (cons x set1))
		(else ( cons (car set1) (adjoin-set x (cdr set1))))))
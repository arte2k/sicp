(define (reverse x)
	(if (null? (cdr x)) (list (car x))
	(append (reverse (cdr x)) (list (car x)))))
	


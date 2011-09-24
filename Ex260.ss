(define (element-of-set? x set)
	(cond
		(null? set) #f 
		((equal? x (car set)) #t)
		(else (element-of-set? x (cdr set)))))
		
(define (adjoin-set x set)
	(cons x set)) 

(define (union-set set1 set2))

, and intersection-set
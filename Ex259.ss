(define (element-of-set? x set)
	(cond ((null? set) #f)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
	(define (build-union-set-iter set1 union)
		(cond
			((null? set1) union) 
			((element-of-set? (car set1) set2) 
				 (build-union-set-iter (cdr set1)  (adjoin-set (car set1) union)))
			(else (build-union-set-iter (cdr set1)  union))))
	(build-union-set-iter set1 '()))

(define (adjoin-set x set)
(if (element-of-set? x set)
set
(cons x set)))
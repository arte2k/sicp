(define (double a) (+ a a))

(define (even? n)
	(= (remainder n 2) 0))

(define (halve a) (/ a 2))

(define (mult-iter c a b)
	(cond ((= b 0) c)
		((even? b) (mult-iter c (double a) (halve b)))
		(else (mult-iter (+ c a) a (- b 1)))))

(define (* a b)
	(mult-iter 0 a b))
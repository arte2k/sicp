(define (double a) (+ a a))

(define (even? n)
	(= (remainder n 2) 0))

(define (halve a) (/ a 2))


(define (* a b)
	(cond ((= b 0) 0)
	((even? b) (* (double a) (halve b)))
	(else (+ a (* a (- b 1))))))
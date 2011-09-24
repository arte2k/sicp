(define (test x)((repeated square 2) x))

(define (square x) (* x x))
(define (inc x)(+ x 1))

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
	(if (= n 1)  (lambda(x) (f x))
		(lambda(x) (f ((repeated f (- n 1)) x)))))
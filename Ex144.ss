(define dx 0.000001)

(define (average a b c) (/ (+ a b c) 3))

(define (repeated f n)
	(if (= n 1)  (lambda(x) (f x))
		(lambda(x) (f ((repeated f (- n 1)) x)))))

(define (smooth f)
	(lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))
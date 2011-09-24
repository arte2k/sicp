(define tolerance 0.00001)

(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(newline)
		(display guess) 
		(let ((next (/(+ guess (f guess)) 2)))
		(if (close-enough? guess next)
			next 
			(try next))))
	(try first-guess))

(define (golden-ratio first-guess)
	(fixed-point (lambda (x) (+ 1.0 (/ 1 x))) first-guess))

(define (func1 first-guess)
	(fixed-point (lambda (x) (/ (log 1000)(log x))) first-guess))
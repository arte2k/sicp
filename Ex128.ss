(define (expmod base exp m n)
	(cond ((= exp 0) 1)
	((even? exp)
		(cond (= (- n 1)  (remainder (square (expmod base (/ exp 2) m n))m)) 0))
	(else
		(remainder (* base (expmod base (- exp 1) m n))m))))

(define (fermat-test n)
	(define (try-it a)(= (expmod a n n n) a))
	(try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
	(cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))


(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (get-even-nbr i) (- (* 2 i) 1))

(define (tan-cf x k)
	(define (next i)
		(cond ((= i k) (/ (square x) (get-even-nbr i)))
			(else (- (get-even-nbr i) (/ (square x) (next (inc i)))))))
	 (/ x (next 1)))
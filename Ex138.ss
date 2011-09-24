(define (inc i) (+ i 1))
(define (dec i) (- i 1))

(define (cont-frac n d k)
	(define (count i)
		(if (= i k) 
		(/ (n i) (d i) )
		(/ (n i) (+ (d i) (count (inc i) )))))
	(count 1))

(define (cont-frac-iter n d k)
 (define (iter acc i)
 	(if (= i 1) acc
 	(iter (/ (n i) (+ (d i) acc)) (dec i))))
 (iter 0 k)
)

(define (test k)
(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) k))

(define (e k)
	(+ 2 (cont-frac-iter d-coeff (lambda (i) 1.0) k)))

(define (integer-div divident divisor)
	(/ (- divident (remainder divident divisor)) divisor))

(define (d-coeff i)
	(cond ((= i 1) 1)
		((= i 2) 2)
		((= 0 (remainder i 3)) 1)
		((= 1 (remainder i 3)) 1)
		(else (* 2 (+ 1 (integer-div i 3))))))



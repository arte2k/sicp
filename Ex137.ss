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
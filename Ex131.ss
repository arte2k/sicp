(define (product f next a b )
 (if (> a b) 1
 	(* (f a) (product f next (next a) b))))

(define (product-iter f next a b)
	(define (iter n result)
		(if (> n b) result
		(iter (next n) (* result (f n)))))
	(iter a 1))

(define (inc n) (+ n 1))

(define (even? n) (= (remainder n 2) 0))

(define (self n) (+ n 0))

(define (pi-aprox n)
	(define (top k)
		(cond  ((= k 1) 2)
			((even? k) (+ k 2))
			(else (+ k 1)))
	)
	(define (bottom k)
		(if (even? k) (+ k 1)
			(+ k 2)))
	(* 4.0 (/ (product-iter top inc 1 n) (product-iter bottom inc 1 n)))
)


(define (factorial n)
	(product self inc 1 n))
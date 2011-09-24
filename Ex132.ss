(define (accumulate combiner null-value term a next b)
	(if (> a b) null-value
	(combiner (term a) (accumulate combiner null-value term (next a) b)))

(define (accumulate-iter combiner null-value term a next b)
	(define (iter n result)
		(if (> a b) null-value
		(iter (next n) (combiner result (term a))))))
	)
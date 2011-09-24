(load "tools.ss")

(define (ordered-triplets n)
	(accumulate append nil (
		map (
			lambda(i) (append nil (
				map ( lambda(j) (
						map (lambda(k) (list i j k)) (enumerate-interval j)))
				 	(enumerate-interval i))))
			(enumerate-interval n)) ))

(define (is-sum-equal? s)
	(lambda(triplet)
	(= s (+ (car triplet) (cadr triplet) (caddr triplet)))))

(define (test s n)
	(filter (is-sum-equal? s) (ordered-triplets n) ))
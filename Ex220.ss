(define (same-parity x . y)
	(if (even? x) (append (list x) (parity-list even? y))
		(append (list x) (parity-list odd? y))))

(define (even? x)
	(define (halve) (/ x 2))
	(= 0 (- (halve) (floor (halve)))))

(define (odd? x) (if (even? x) #f #t))

(define (parity-list parity? x)
	(cond ((null? x) x)
		  ((parity? (car x)) (append (list (car x)) (parity-list parity? (cdr x))))
		  (else (parity-list parity? (cdr x)))))
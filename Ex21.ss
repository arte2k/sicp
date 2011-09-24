(define (inv x) (- 0 x))

(define (make-rat n d)
	(cond ((and (< n 0) (< d 0)) (cons (abs n) (abs d)))
		((and (> n 0) ( > d 0)) (cons n d))
		(else (cons (inv (abs n)) (abs d)))))
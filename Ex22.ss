(define (make-point x y)
	(cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (avg x y) (/ (+ x y) 2))

(define (make-segment start-point end-point)
	(cons start-point end-point))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (print-point p)
(newline)
(display "(")
(display (x-point p))
(display ",")
(display (y-point p))
(display ")"))

(define (midpoint-segment segment) 
	(make-point 
		(avg (x-point (start-segment segment)) (x-point (end-segment segment)))
		(avg (y-point (start-segment segment)) (y-point (end-segment segment)))
		)
		)


(define (test) 
	(print-point (midpoint-segment 
		(make-segment (make-point 1 1 ) (make-point 3 3) ))))

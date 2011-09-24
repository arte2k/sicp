(define (dec x) (- x 1))

(define (exp base up)
	(if (= up 0) 1
		(* base (exp base (dec up)))))

(define (my-cons a b)
	(* (exp 2 a) (exp 3 b)))

(define (occurences number p)
	(define (div-p) (/ p number))
	(if (= 0 (- (div-p) (floor (div-p)))) (+ 1 (occurences number (div-p)) )
		0))

(define (my-car p)
	(occurences 2 p))

(define (my-cdr p)
	(occurences 3 p))
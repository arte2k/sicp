(define (cube x) (* x x x))
(define (square x) (* x x))

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (cube_sqrt-iter prev_guess guess x)
	(if (good-enough? prev_guess guess x)
	guess
	(cube_sqrt-iter guess (improve guess x)
				x)))

(define (improve guess x)
  (/(+ (/ x (square guess)) (* 2 guess)) 3))


(define (good-enough? prev_guess guess x)
  (if ( < prev_guess guess)
    (< (- 1 (/ prev_guess guess)) 0.001)
    (< (- 1 (/ guess prev_guess)) 0.001)))

(define (cube_sqrt x)
  (cube_sqrt-iter 0 1.0 x))
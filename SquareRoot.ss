(define (square x) (* x x))

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (sqrt-iter prev_guess guess x)
	(if (good-enough? prev_guess guess x)
	guess
	(sqrt-iter guess (improve guess x)
				x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? prev_guess guess x)
  (if ( < prev_guess guess)
    (< (- 1 (/ prev_guess guess)) 0.001)
    (< (- 1 (/ guess prev_guess)) 0.001)))

(define (sqrt x)
  (sqrt-iter 0 1.0 x))
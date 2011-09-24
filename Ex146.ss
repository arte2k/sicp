(define (iterative-improve good-enough? improve )
 (lambda (guess) ( if (good-enough? guess) guess 
 			((iterative-improve good-enough? improve) (improve guess)))))

(define (square x) (* x x))

(define (improve-sqrt-factory sq-product)
(lambda (guess) (average guess (/ sq-product guess))))

(define (average x y)
(/ (+ x y) 2))

(define (good-enough-sqrt-factory sq-product)
(lambda (guess) 
 	(newline) 
 	(display " square product=")(display sq-product) 
 	(display " guess=") (display guess)
 	(display " result=") (display (< (abs (- (square guess) sq-product)) 0.001))
 	(newline)
    (< (abs (- (square guess) sq-product)) 0.001)))


(define (sqrt x) 		 
((iterative-improve (good-enough-sqrt-factory x) (improve-sqrt-factory x)) 1.0))
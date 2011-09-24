(load "Ex21.ss")


(define (make-rect a b c d) 
	(cons (cons a b) (cons c d)))

(define (short-side rect))

(define (long-side rect))

(define (perimeter rect) (* (+ (long-side rect) (short-side rect)) 2))

(define (area rect) (* (long-side rect) (short-side rect)))
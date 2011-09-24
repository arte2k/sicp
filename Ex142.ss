(define (test) ((compose square inc) 6))

(define (square x) (* x x))
(define (inc x)(+ x 1))

(define (compose f g) (lambda (x) (f (g x))))
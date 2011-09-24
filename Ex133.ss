(define (accumulate-filter combiner null-value term a next b filter?)
	(cond ((> a b) null-value)
	((filter? a) 
	(combiner (term a) (accumulate-filter combiner null-value term (next a) next b filter?)))
	(else (accumulate-filter combiner null-value term (next a) next b filter?))))

(define (sum-prime-squares a b)
	(define (adder x y) (+ x y))
	(define (inc x) (+ x 1))
	(accumulate-filter adder 0 square a inc b prime? ))

(define (test a b) (sum-prime-squares a b))

(define (square x) (* x x))

(define (smallest-divisor n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
	(= (remainder b a) 0))

(define (prime? n)
	(= n (smallest-divisor n)))
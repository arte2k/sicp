(use-modules (srfi srfi-19))

(define (current-seconds) (time-nanosecond (current-time time-utc)))

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

(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (current-seconds)))

(define (start-prime-test n start-time)
	(if (prime? n)
		(report-prime (- (current-seconds) start-time))))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))
	(newline)

(define (search-for-primes start num)
	(search-for-primes-iter start num 0))

(define (search-for-primes-iter n num primes-found)
	(cond ((= primes-found num) 0)
		((prime? n) (display n) (newline) (search-for-primes-iter (+ n 1 ) num (+ 1 primes-found)))
		(else (search-for-primes-iter (+ n 1) num primes-found)))
)

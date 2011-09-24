(define nil '())

(define (fold-left op initial sequence)
(define (iter result rest)
(if (null? rest)
result
(iter (op result (car rest))
(cdr rest))))
(iter initial sequence))


(define (fold-right op initial sequence)
	(define (acc op seq)
		(if (null? seq) initial
		(op (car seq) (acc op (cdr seq) ))))
		(acc op sequence))
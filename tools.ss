(define nil '())


(define (accumulate op initial seq)
		(if (null? seq) initial
		(op (car seq) (accumulate op initial (cdr seq) ))))

		
(define (enumerate-interval n)
	(if (= n 0) nil
	(append (enumerate-interval (- n 1)) (list n))))

(load "Ex133.ss")

(define nil '())


(define (accumulate op initial seq)
		(if (null? seq) initial
		(op (car seq) (accumulate op initial (cdr seq) ))))


(define (enumerate-interval n)
	(if (= n 0) nil
	(append (enumerate-interval (- n 1)) (list n))))

(define (unique-pairs n)
	(accumulate append nil (
		map (lambda (i) (
			map (lambda(j) (
				list i j)) (enumerate-interval (- i 1)))
			) (enumerate-interval n))))

(define (prime-sum? pair)
(prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
	(map make-pair-sum
		(filter prime-sum? (unique-pairs n))))

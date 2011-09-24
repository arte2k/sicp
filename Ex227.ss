(define nil '())

(define (reverse x)
	(if (null? (cdr x)) (list (car x))
	(append (reverse (cdr x)) (list (car x)))))
	
(define (deep-reverse x)
	(cond 
	((null? x) nil)
	((pair? (car x)) (append (deep-reverse (cdr x)) (list (deep-reverse (car x))) ))
	(else (append (deep-reverse (cdr x)) (list (car x))))))


(define (fringe x)
	(cond 
	((null? x) nil)
	((not (pair? x)) (list x))
	(else (append (fringe (cdr x)) (fringe (car x))) )
	))
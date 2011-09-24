(define (accumulate op initial sequence)
	(if (null? sequence) initial
	(op (car sequence) (accumulate op initial (cdr sequence)))))


(define (count-leaves t)
	(accumulate 
		+ 
		0 
		(map (
			lambda (sub-tree) (
				if (not (pair? sub-tree)) 1
				(count-leaves sub-tree)) ) t) ))

(define (test ) (count-leaves (list 1 (list 2 (list 3 4)) 5)))
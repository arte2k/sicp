(define (accumulate op initial sequence)
	(if (null? sequence) initial
	(op (car sequence) (accumulate op initial (cdr sequence)))))


(define (horner-eval x coefficient-sequence)
	(accumulate 
		(lambda (this-coeff higher-terms) 
			(if (pair? higher-terms) 
				(+ this-coeff (* x (horner-eval x higher-terms)))
				(+ this-coeff (* x higher-terms)))
			) 
		0 coefficient-sequence))
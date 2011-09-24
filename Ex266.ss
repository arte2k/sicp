(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
(list entry left right))


(define (get-key record) (car record))

(define (lookup key db)
	(if (null? db) '()
	(let ((db-key (get-key (entry db))))
	(cond 
		((= db-key key) entry)
		((> db-key key) (lookup key (left-branch db)))
		((< db-key key) (lookup key (right-branch db)))))))
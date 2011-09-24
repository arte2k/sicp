(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
(list entry left right))


(define (list->tree elements)
(car (partial-tree elements (length elements))))
(define (partial-tree elts n)
(if (= n 0)
(cons ’() elts)
(let ((left-size (quotient (- n 1) 2)))
(let ((left-result (partial-tree elts left-size)))
(let ((left-tree (car left-result))
(non-left-elts (cdr left-result))
(right-size (- n (+ left-size 1))))
(let ((this-entry (car non-left-elts))
(right-result (partial-tree
(cdr non-left-elts)
right-size)))
(let ((right-tree (car right-result))
(remaining-elts (cdr right-result)))
(cons (make-tree
this-entry left-tree right-tree)
remaining-elts))))))))

(define (tree->list-1 tree)
(if (null? tree)
’()
(append (tree->list-1 (left-branch tree))
(cons (entry tree)
(tree->list-1 (right-branch tree))))))
(define (tree->list-2 tree)
(define (copy-to-list tree result-list)
(if (null? tree)
result-list
(copy-to-list (left-branch tree)
(cons (entry tree)
(copy-to-list
(right-branch tree)
result-list)))))
(copy-to-list tree ’()))

(define (union-set set1 set2)
	(let ((x1 (entry set1)) (x2 (entry set2)))
		(cond 
			(= x1 x2) 
				(make-tree x1 (union-set (left-branch set1) (left-branch set2))))))


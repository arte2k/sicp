(load "Ex238.ss")

(define (reverse sequence)
(fold-right (lambda (x y) (append y (list x))) nil sequence))


(define (reverse-2 sequence)
(fold-left (lambda (x y) (append (list y) x )) nil sequence))
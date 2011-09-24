(load "tools.ss")

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
	(accumulate append nil (map proc seq)))

(define empty-board nil)

(define (queens board-size)
	(define (queen-cols k)
		(if (= k 0)
			(list empty-board)
			(filter
				(lambda (positions) (safe? k positions))
				(flatmap
					(lambda (rest-of-queens)
						(map (lambda (new-row)
							(adjoin-position new-row k rest-of-queens))
						(enumerate-interval 1 board-size)))
					(queen-cols (- k 1))))))
		(queen-cols board-size))


(define (position-row position) (cdr position))
(define (position-col position) (car position))
(define (adjoin-position row col items) (list (append items (cons row col) )))

(define (cons-position col row) (cons col row))



(define (safe? column positions)
	(define (get-row col) (position-row (car (filter (
		lambda(position) (= column (position-col position))) positions))))
	(define (is-on-diagonal? position row)
		(= (abs (- (position-row position) row)) 
		(abs (- (position-column position) column))))
	(if (null? positions) #t
	(null? (filter (lambda(position)
		(cond ((= (get-row column) (position-row position)) #t)
			((is-on-diagonal position? (get-row column) ) #t)
			(else #f))) positions))))
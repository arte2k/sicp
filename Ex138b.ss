(define (cont-frac n d k)
  (define (iter i sub-expr)
    (if (= i 0)
        sub-expr
        (iter (- i 1) (/ (n i) (+ (d i) sub-expr)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (e k)
  (+ (cont-frac (lambda (i) 1.0)
             (lambda (i) (if (= (remainder (+ i 1) 3) 0)
                             (* 2 (/ (+ i 1) 3))
                             1.0))
             k)
     2))
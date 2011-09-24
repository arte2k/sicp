(define (integral f a b dx)
 	(define (add-dx x) (+ x dx))
	(* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (sum term a next b)
	(if (> a b) 0
	(+ (term a) (sum term (next a) next b))))

(define (sum-seq start end f coeff)
	(if (= start end ) (* (coeff start) (f start))
	(+ (* (coeff start) (f start)) (sum-seq (inc start) end f coeff))))

(define (inc n) (+ n 1))

(define (cube x) (* x x x))

(define (even? n)
	(= (remainder n 2) 0))

(define  (simpsons-integral f a b n)
	(define (simpsons-coeff k)
	 (cond ((= k 0) 1)
	 	((= k n) 1)
	 	((even? k) 2)
	 	(else 4)))
	 (define (simpsons-elem k)
	  (f (+ a (* k (/ (- b a) n)))))
	(* (/ (- b a) n) (sum-seq 1 n simpsons-elem simpsons-coeff)))

(define (cube1 n) (integral cube 0 1 (/ 1 n)) )

(define (cube2 n) (simpsons-integral cube 0.0 1.0 n) )
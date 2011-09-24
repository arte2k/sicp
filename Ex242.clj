;(ns your-namespace
;  (:require clojure.contrib.math))



(defn flatmap [proc seq]
    (reduce conj '() (map proc seq)))

(defn queen-position [column row] (list column row))

(defn enumarate-interval [init end]
    (if (= init end) 
        (list end)
        (cons init (enumarate-interval (+ 1 init) end))))

(defn queen-row [position]
    (first (rest position)))


(defn queen-col [position]
    (first position))

(defn adjoin-position [row column prev-queens]
    (list (queen-position row column) prev-queens))


(defn safe? [column positions]
    (defn get-row []
        (queen-row (
            filter
                (fn [position]
                    (= column (queen-col position)))
            positions)))
    (defn on-diagonal? [position]
        (= (Math/abs (- (queen-col position) column))
        (Math/abs (- (queen-row position) (get-row)))))
    (remove (fn [position]
        (cond 
            (= column (queen-col position) true)
            (on-diagonal? position)
            (else false)))))




(defn queens [board-size]
    (defn queen-cols [k]
       (if (= k 0) '()
            (filter 
                (fn [positions] (safe? k positions))
                (flatmap 
                    (fn [rest-of-queens]
                        (map 
                            (fn [new-row]
                                (adjoin-position new-row
                                                 k
                                                 rest-of-queens)))
                            (enumarate-interval 1 board-size))
                    (queen-cols (- k 1)))))))

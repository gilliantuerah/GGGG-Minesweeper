;;;*************
;;;* TEMPLATES *
;;;*************

(deftemplate boxValue
    (slot x)
    (slot y)
    (slot value)
)
(deftemplate select
    (slot x)
    (slot y)
)
(deftemplate opened
    (slot x)
    (slot y))
(deftemplate markMine
    (slot x)
    (slot y))
(deftemplate countMine
    (slot n))
(deftemplate gameOver
    (slot bool))
;;; ###########
;;; SETUP RULES
;;; ###########

;;; **********
;;; initialize
;;; **********

(defrule initialize 
    (initial-fact)
    =>
    (assert (select (x 0) (y 0)))
    (assert (countMine (n 8)))
    (assert (gameOver (bool False))))

;;; *****************
;;; Rule untuk 1 mine
;;; *****************

(defrule markedMine1a
    ; ada mark mine di (x,y+1)
    (boxValue (x ?x) (y ?y) (value 1))
    (markMine (x ?x) (y ?a))
    (test(= ?a (+ ?y 1)))
    (gameOver (bool False))
    =>
    (assert (select (x (+ ?x 1)) (y (+ ?y 1))))
    (assert (select (x (+ ?x 1)) (y ?y)))
    (assert (select (x (+ ?x 1)) (y (- ?y 1))))
    (assert (select (x ?x) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y ?y)))
    (assert (select (x (- ?x 1)) (y (+ ?y 1))))
)
(defrule markedMine1b
    ; ada mark mine di (x,y-1)
    (boxValue(x ?x)(y ?y)(value 1))
    (markMine (x ?x) (y ?a))
    (test(= ?a (- ?y 1)))
    (gameOver(bool False))
    =>
    (assert (select (x (+ ?x 1)) (y (+ ?y 1))))
    (assert (select (x (+ ?x 1)) (y ?y)))
    (assert (select (x (+ ?x 1)) (y (- ?y 1))))
    (assert (select (x ?x) (y (+ ?y 1))))
    (assert (select (x (- ?x 1)) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y ?y)))
    (assert (select (x (- ?x 1)) (y (+ ?y 1))))
    
)
(defrule markedMine1c
    ; ada mark mine di (x+1,y+1)
    (boxValue(x ?x)(y ?y)(value 1))
    (markMine (x ?a) (y ?b))
    (test(= ?a (+ ?x 1)))
    (test(= ?b (+ ?y 1)))
    (gameOver(bool False))
    =>
    (assert (select (x ?x) (y (+ ?y 1))))
    (assert (select (x (+ ?x 1)) (y ?y)))
    (assert (select (x (+ ?x 1)) (y (- ?y 1))))
    (assert (select (x ?x) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y ?y)))
    (assert (select (x (- ?x 1)) (y (+ ?y 1))))
   
)
(defrule markedMine1d
    ; ada mark mine di (x+1,y-1)
    (boxValue(x ?x)(y ?y)(value 1))
    (markMine (x ?a) (y ?b))
    (test(= ?a (+ ?x 1)))
    (test(= ?b (- ?y 1)))
    (gameOver(bool False))
    =>
    (assert (select (x (+ ?x 1)) (y (+ ?y 1))))
    (assert (select (x (+ ?x 1)) (y ?y)))
    (assert (select (x ?x) (y (+ ?y 1))))
    (assert (select (x ?x) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y ?y)))
    (assert (select (x (- ?x 1)) (y (+ ?y 1))))
    
)
(defrule markedMine1e
    ; ada mark mine di (x+1,y)
    (boxValue(x ?x)(y ?y)(value 1))
    (markMine (x ?a) (y ?y))
    (test(= ?a (+ ?x 1)))
    (gameOver(bool False))
    =>
    (assert (select (x (+ ?x 1)) (y (+ ?y 1))))
    (assert (select (x ?x) (y (+ ?y 1))))
    (assert (select (x (+ ?x 1)) (y (- ?y 1))))
    (assert (select (x ?x) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y ?y)))
    (assert (select (x (- ?x 1)) (y (+ ?y 1))))
   
)
(defrule markedMine1f
    ; ada mark mine di (x-1,y-1)
    (boxValue(x ?x)(y ?y)(value 1))
    (markMine (x ?a) (y ?b))
    (test(= ?a (- ?x 1)))
    (test(= ?b (- ?y 1)))
    (gameOver(bool False))
    =>
    (assert (select (x (+ ?x 1)) (y (+ ?y 1))))
    (assert (select (x (+ ?x 1)) (y ?y)))
    (assert (select (x (+ ?x 1)) (y (- ?y 1))))
    (assert (select (x ?x) (y (- ?y 1))))
    (assert (select (x ?x) (y (+ ?y 1))))
    (assert (select (x (- ?x 1)) (y ?y)))
    (assert (select (x (- ?x 1)) (y (+ ?y 1))))
    
)
(defrule markedMine1g
    ; ada mark mine di (x-1,y+1)
    (boxValue(x ?x)(y ?y)(value 1))
    (markMine (x ?a) (y ?b))
    (test(= ?a (- ?x 1)))
    (test(= ?b (+ ?y 1)))
    (gameOver(bool False))
    =>
    (assert (select (x (+ ?x 1)) (y (+ ?y 1))))
    (assert (select (x (+ ?x 1)) (y ?y)))
    (assert (select (x (+ ?x 1)) (y (- ?y 1))))
    (assert (select (x ?x) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y ?y)))
    (assert (select (x ?x) (y (+ ?y 1))))
    
)
(defrule markedMine1h
    ; ada mark mine di (x-1,y)
    (boxValue(x ?x)(y ?y)(value 1))
    (markMine (x ?a) (y ?y))
    (test(= ?a (- ?x 1)))
    (gameOver(bool False))
    =>
    (assert (select (x (+ ?x 1)) (y (+ ?y 1))))
    (assert (select (x (+ ?x 1)) (y ?y)))
    (assert (select (x (+ ?x 1)) (y (- ?y 1))))
    (assert (select (x ?x) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y (- ?y 1))))
    (assert (select (x ?x) (y (+ ?y 1))))
    (assert (select (x (- ?x 1)) (y (+ ?y 1))))
    
)


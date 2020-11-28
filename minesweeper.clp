;;;*************
;;;* TEMPLATES *
;;;*************

(deftemplate BoxValue
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
    (slot y)
)
(deftemplate markMine
    (slot x)
    (slot y)
)
(deftemplate countMine
    (slot n)
)
(deftemplate gameOver
    (slot bool)
)
;;; ###########
;;; SETUP RULES
;;; ###########

;;; **********
;;; initialize
;;; **********

(defrule initialize

   =>

   (assert (phase grid-values))
   (assert (size-value (size 1) (value 1)))

   (assert (select(x 0)(y 0)))
   (assert (countMine(n )))
   (assert (gameOver(False)))



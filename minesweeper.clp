;;;*************
;;;* TEMPLATES *
;;;*************

(deftemplate boxValue
    (slot x)
    (slot y)
    (slot value)
    (slot flagcount)
    (slot opened)
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
    ; jika markMine, auto opened
    (slot x)
    (slot y)
)

(deftemplate cekCountFlags
    (slot xHome)
    (slot yHome)
    (slot xCek)
    (slot yCek)
)

(deftemplate cekCountOpened
    (slot xHome)
    (slot yHome)
    (slot xCek)
    (slot yCek)
)

;;;**********
;;;* PYTHON *
;;;**********
(deftemplate boxValuePython
    (slot x)
    (slot y)
    (slot value)
)

(deftemplate banyakMinesPython
    (slot n)
)

(deftemplate sizeBoardPython
    (slot n)
)

(deftemplate minesKoordpython
    (slot x)
    (slot y)
)
;;; ***************************
;;; sisa bom yang belum di-flag
;;; ***************************
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
    (initial-fact)
    (banyakMinesPython(n ?n))
    =>
    (assert (select (x 0) (y 0)))
    (assert (boxValue(x 0) (y 0) (value 0) (flagcount 0) (opened 0)))
    (assert (countMine (n ?n)))
    (assert (gameOver (bool False))))


;;; *****************
;;; Rule untuk inisialisasi nilai parameter pada suatu boxValue
;;; *****************

; (defrule countunopened
;     ;;;;; BELUM HANDLE KOTAK PINGGIRAN ;;;;;
;     ;; box blm dicek ;;
;     ; opened -> flag dan non flag ;
;     ; ?f1 <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?flagcount) (unopened 99))
;     ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?flagcount) (unopened 0))
;     =>
;     (bind ?count 0)
;     (if (opened (x (+ ?x 1)) (y (+ ?y 1)))  then (bind ?count (+ ?count 1)))
;     (if (opened (x (+ ?x 1)) (y ?y)) then (bind ?count (+ ?count 1)))
;     (if (opened (x (+ ?x 1)) (y (- ?y 1))) then (bind ?count (+ ?count 1)))
;     (if (opened (x ?x) (y (+ ?y 1))) then (bind ?count (+ ?count 1)))
;     (if (opened (x ?x) (y (- ?y 1))) then (bind ?count (+ ?count 1)))
;     (if (opened (x (- ?x 1)) (y (- ?y 1))) then (bind ?count (+ ?count 1)))
;     (if (opened (x (- ?x 1)) (y ?y)) then (bind ?count (+ ?count 1)))
;     (if (opened (x (- ?x 1)) (y (+ ?y 1))) then (bind ?count (+ ?count 1)))
;     ; (modify ?f1 (unopened (- 8 ?count)))
; )

(defrule countOpened1
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?flagcount) (opened ?opened))
    (opened (x ?a) (y ?b))
    
    ?f1 <- (cekCountOpened(xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (+ ?x 1)))
    (test(= ?b (+ ?y 1)))
    =>
    (modify ?f (opened (+ ?opened 1)))
    (retract ?f1)
)

(defrule countOpened2
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?flagcount) (opened ?opened))
    (opened (x ?a) (y ?b))
    
    ?f1 <- (cekCountOpened(xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (+ ?x 1)))
    (test(= ?b ?y))
    =>
    (modify ?f (opened (+ ?opened 1)))
    (retract ?f1)
)

(defrule countOpened3
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?flagcount) (opened ?opened))
    (opened (x ?a) (y ?b))

    ?f1 <- (cekCountOpened(xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (+ ?x 1)))
    (test(= ?b (- ?y 1)))
    =>
    (modify ?f (opened (+ ?opened 1)))
    (retract ?f1)
)

(defrule countOpened4
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?flagcount) (opened ?opened))
    (opened (x ?a) (y ?b))

    ?f1 <- (cekCountOpened(xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a ?x))
    (test(= ?b (+ ?y 1)))
    =>
    (modify ?f (opened (+ ?opened 1)))
    (retract ?f1)
)

(defrule countOpened5
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?flagcount) (opened ?opened))
    (opened (x ?a) (y ?b))
    
    ?f1 <- (cekCountOpened(xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a ?x))
    (test(= ?b (- ?y 1)))
    =>
    (modify ?f (opened (+ ?opened 1)))
    (retract ?f1)
)

(defrule countOpened6
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?flagcount) (opened ?opened))
    (opened (x ?a) (y ?b))

    ?f1 <- (cekCountOpened(xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (- ?x 1)))
    (test(= ?b (+ ?y 1)))
    =>
    (modify ?f (opened (+ ?opened 1)))
    (retract ?f1)
)

(defrule countOpened7
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?flagcount) (opened ?opened))
    (opened (x ?a) (y ?b))
    
    ?f1 <- (cekCountOpened(xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (- ?x 1)))
    (test(= ?b ?y))
    =>
    (modify ?f (opened (+ ?opened 1)))
    (retract ?f1)
)

(defrule countOpened8
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?flagcount) (opened ?opened))
    (opened (x ?a) (y ?b))
    
    ?f1 <- (cekCountOpened(xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (- ?x 1)))
    (test(= ?b (- ?y 1)))
    =>
    (modify ?f (opened (+ ?opened 1)))
    (retract ?f1)
)
; (defrule initCountflag
;     ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount 0) (unopened ?unopened))
;     (markMine(x (+ ?x 1)) (y (+ ?y 1)))
;     =>
;     (modify ?f (flagcount 1))
; )


;**************************
; Hitung Flag di Sekitarnya
;**************************
(defrule countflag1
    (declare (salience 10))
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?count) (opened ?opened))
    (markMine(x ?a) (y ?b))
    
    ?f1 <- (cekCountFlags (xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (+ ?x 1)))
    (test(= ?b (+ ?y 1)))
    =>
    (modify ?f (flagcount (+ ?count 1)))
    (retract ?f1)
)

(defrule countflag2
    (declare (salience 10))
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?count) (opened ?opened))
    (markMine(x ?a) (y ?b))
    
    ?f1 <- (cekCountFlags (xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (+ ?x 1)))
    (test(= ?b ?y))
    =>
    (modify ?f (flagcount (+ ?count 1)))
    (retract ?f1)
)

(defrule countflag3
    (declare (salience 10))
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?count) (opened ?opened))
    (markMine(x ?a) (y ?b))
    
     ?f1 <- (cekCountFlags (xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (+ ?x 1)))
    (test(= ?b (- ?y 1)))
    =>
    (modify ?f (flagcount (+ ?count 1)))
    (retract ?f1)
)

(defrule countflag4
    (declare (salience 10))
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?count) (opened ?opened))
    (markMine(x ?a) (y ?b))
    
    ?f1 <- (cekCountFlags (xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a ?x))
    (test(= ?b (+ ?y 1)))
    =>
    (modify ?f (flagcount (+ ?count 1)))
    (retract ?f1)
)

(defrule countflag5
    (declare (salience 10))
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?count) (opened ?opened))
    (markMine(x ?a) (y ?b))
    
    ?f1 <- (cekCountFlags (xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a ?x))
    (test(= ?b (- ?y 1)))
    =>
    (modify ?f (flagcount (+ ?count 1)))
    (retract ?f1)
)

(defrule countflag6
    (declare (salience 10))
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?count) (opened ?opened))
    (markMine(x ?a) (y ?b))
    
    ?f1 <- (cekCountFlags (xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (- ?x 1)))
    (test(= ?b (- ?y 1)))
    =>
    (modify ?f (flagcount (+ ?count 1)))
    (retract ?f1)
)

(defrule countflag7
    (declare (salience 10))
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?count) (opened ?opened))
    (markMine(x ?a) (y ?b))
    
    ?f1 <- (cekCountFlags (xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (- ?x 1)))
    (test(= ?b ?y))
    =>
    (modify ?f (flagcount (+ ?count 1)))
    (retract ?f1)
)

(defrule countflag8
    (declare (salience 10))
    ?f <- (boxValue (x ?x) (y ?y) (value ?value) (flagcount ?count) (opened ?opened))
    (markMine(x ?a) (y ?b))
    
    ?f1 <- (cekCountFlags (xHome ?x) (yHome ?y) (xCek ?a) (yCek ?b))
    (test(= ?a (- ?x 1)))
    (test(= ?b (+ ?y 1)))
    =>
    (modify ?f (flagcount (+ ?count 1)))
    (retract ?f1)
)

;;; *************************************************************************************
;;; Rule 1: Kalo jumlah unopened = value dari (kotak tersebut - jumlah flag) -> mark mine
;;; *************************************************************************************

; (defrule countUnopenedPojok1
;     ?f <- (boxValue (x 0) (y 0) (value ?value) (flagcount ?count) (opened ?opened))
;     =>
;     (modify ?f (flagcount (+ ?count 1)))
; )

; (defrule countUnopenedPojok2
;     (boxValue (x 0) (y ) (value ?value) (flagcount ?count) (opened ?opened))
; )

; (defrule countUnopenedPojok3
;     (boxValue (x ) (y 0) (value ?value) (flagcount ?count) (opened ?opened))
; )

; (defrule countUnopenedPojok4
;     (boxValue (x ) (y ) (value ?value) (flagcount ?count) (opened ?opened))
; )

; (defrule countUnopenedPinggirAtas
;     (boxValue (x ) (y 0) (value ?value) (flagcount ?count) (opened ?opened))
; )

; (defrule countUnopenedPinggirKiri
;     (boxValue (x 0) (y ) (value ?value) (flagcount ?count) (opened ?opened))
; )

; (defrule countUnopenedPinggirKanan
;     (boxValue (x ) (y 0) (value ?value) (flagcount ?count) (opened ?opened))
; )

; (defrule countUnopenedPinggirBawah
;     (boxValue (x ) (y ) (value ?value) (flagcount ?count) (opened ?opened))
; )

(defrule markval
    (boxValue (x ?x) (y ?y) (value ?val) (flagcount ?flag) (opened ?opened))
    (test(= ?val (+ ?flag ?opened)))
    ; modify fakta countMine
    ?f1 <- (countMine(n ?nilai))
    
    =>
    
    (
        if (not(opened (x (+ ?x 1)) (y (+ ?y 1)))) then 
            (assert(opened(x (+ ?x 1)) (y (+ ?y 1))))
            (assert(markMine(x (+ ?x 1)) (y (+ ?y 1))))                 
    )
    (
        if (not(opened (x (+ ?x 1)) (y ?y))) then 
            (assert(opened(x (+ ?x 1)) (y ?y)))
            (assert(markMine(x (+ ?x 1)) (y ?y)))                 
    )
    (
        if (not(opened (x (+ ?x 1)) (y (- ?y 1)))) then 
            (assert(opened(x (+ ?x 1)) (y (- ?y 1))))
            (assert(markMine(x (+ ?x 1)) (y (- ?y 1))))                 
    )
    (
        if (not(opened (x ?x) (y (+ ?y 1)))) then 
            (assert(opened(x ?x) (y (+ ?y 1))))
            (assert(markMine (x ?x) (y (+ ?y 1))))                 
    )
    (
        if (not( opened (x ?x) (y (- ?y 1)))) then 
            (assert (opened (x (+ ?x 1)) (y (- ?y 1))))
            (assert(markMine(x ?x) (y (- ?y 1))))   
    )
    (
        if (not(opened (x (- ?x 1)) (y (- ?y 1)))) then 
            (assert(opened(x (- ?x 1)) (y (- ?y 1))))
            (assert(markMine(x (- ?x 1)) (y (- ?y 1))))             
    )
    (
        if (not(opened (x (- ?x 1)) (y ?y))) then 
            (assert(opened(x (- ?x 1)) (y ?y)))
            (assert(markMine(x (- ?x 1)) (y ?y)))             
    )
    (
        if (not(opened (x (- ?x 1)) (y (+ ?y 1)))) then 
            (assert(opened(x (- ?x 1)) (y (+ ?y 1))))
            (assert(markMine(x (- ?x 1)) (y (+ ?y 1))))             
    )
    ; ngurangin countMine sebanyak jumlah unpoened
    (modify ?f1 (n (- ?nilai ?opened)))
)

;;; *********************
;;; Rule 2: Kalo value == jumlah flag, buka yang belum dibuka
;;; *********************

(defrule oneMineMarked
    ; ada satu yang sudah di markMine
    (boxValue (x ?x) (y ?y) (value ?val) (flagcount ?fl))
    ; jika flagcount=val , sisanya dibuka
    (test(= ?fl ?val))
    =>
    (assert (select (x (+ ?x 1)) (y (+ ?y 1))))
    (assert (select (x (+ ?x 1)) (y ?y)))
    (assert (select (x (+ ?x 1)) (y (- ?y 1))))
    (assert (select (x ?x) (y (- ?y 1))))
    (assert (select (x ?x) (y (+ ?y 1))))
    (assert (select (x (- ?x 1)) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y ?y)))
    (assert (select (x (- ?x 1)) (y (+ ?y 1))))
)
;;; *********************
;;; Rule 3: Kalo value == jumlah flag, buka yang belum dibuka
;;; *********************

;;; ********* 
;;; open box
;;; *********
(defrule openOpenedBox
    ; buka box yang sudah dibuka
    ?f <- (select (x ?x)(y ?y))
    (opened (x ?x)(y ?y))
    => 
    (retract ?f)
)

(defrule openUnOpenedBox
    ; buka box yang belum dibuka
    ?f <- (select (x ?x)(y ?y))
    (not(opened (x ?x)(y ?y)))
    ; ngambil value dari python
    (boxValuePython(x ?x)(y ?y)(value ?val))

    =>
    (assert(opened(x ?x)(y ?y)))
    ; nambah fakta checkCountFlags
    (assert(cekCountFlags (xHome ?x) (yHome ?y) (xCek (+ ?x 1)) (yCek (+ ?y 1))))
    (assert(cekCountFlags (xHome ?x) (yHome ?y) (xCek (+ ?x 1)) (yCek ?y)))
    (assert(cekCountFlags (xHome ?x) (yHome ?y) (xCek (+ ?x 1)) (yCek (- ?y 1))))
    (assert(cekCountFlags (xHome ?x) (yHome ?y) (xCek ?x) (yCek (+ ?y 1))))
    (assert(cekCountFlags (xHome ?x) (yHome ?y) (xCek ?x) (yCek (- ?y 1))))
    (assert(cekCountFlags (xHome ?x) (yHome ?y) (xCek (- ?x 1)) (yCek (+ ?y 1))))
    (assert(cekCountFlags (xHome ?x) (yHome ?y) (xCek (- ?x 1)) (yCek ?y)))
    (assert(cekCountFlags (xHome ?x) (yHome ?y) (xCek (- ?x 1)) (yCek (- ?y 1))))
    ; nambah fakta checkCountOpened
    (assert(cekCountOpened (xHome ?x) (yHome ?y) (xCek (+ ?x 1)) (yCek (+ ?y 1))))
    (assert(cekCountOpened (xHome ?x) (yHome ?y) (xCek (+ ?x 1)) (yCek ?y)))
    (assert(cekCountOpened (xHome ?x) (yHome ?y) (xCek (+ ?x 1)) (yCek (- ?y 1))))
    (assert(cekCountOpened (xHome ?x) (yHome ?y) (xCek ?x) (yCek (+ ?y 1))))
    (assert(cekCountOpened (xHome ?x) (yHome ?y) (xCek ?x) (yCek (- ?y 1))))
    (assert(cekCountOpened (xHome ?x) (yHome ?y) (xCek (- ?x 1)) (yCek (+ ?y 1))))
    (assert(cekCountOpened (xHome ?x) (yHome ?y) (xCek (- ?x 1)) (yCek ?y)))
    (assert(cekCountOpened (xHome ?x) (yHome ?y) (xCek (- ?x 1)) (yCek (- ?y 1))))

    (assert(boxValue (x ?x)(y ?y)(value ?val)(flagcount 0)(opened 0)))
    (retract ?f) 
)

(defrule openBoxZeroValue
    ; buka box sekitar box dengan value 0
    (opened(x ?x)(y ?y))
    (boxValue(x ?x)(y ?y)(value 0))
    =>
    (assert (select (x (+ ?x 1)) (y (+ ?y 1))))
    (assert (select (x (+ ?x 1)) (y ?y)))
    (assert (select (x (+ ?x 1)) (y (- ?y 1))))
    (assert (select (x ?x) (y (- ?y 1))))
    (assert (select (x ?x) (y (+ ?y 1))))
    (assert (select (x (- ?x 1)) (y (- ?y 1))))
    (assert (select (x (- ?x 1)) (y ?y)))
    (assert (select (x (- ?x 1)) (y (+ ?y 1))))
)
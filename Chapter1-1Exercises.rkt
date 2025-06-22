#lang scheme

; Exercise 1.1
10 ;10

(+ 5 3 4) ;12

(- 9 1) ;8

(/ 6 2) ;3

(+ (* 2 4) (- 4 6)) ;6

(define a 3)

(define b (+ a 1)) 

(+ a b (* a b)) ;19

(= a b) ; false

(if (and (> b a) (< b (* a b)))
b
a) ;4

(cond ((= a 4) 6)
((= b 4) (+ 6 7 a))
(else 25)) ; 16

(+ 2 (if (> b a) b a)) ;6

(* (cond ((> a b) a)
((< a b) b)
(else -1))
(+ a 1)) ;16



; Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

   
; Exercise 1.3
(define (sum-square-min x y z)
  (cond ( (and (not (< z y)) (not (< z x)) ) (+ (* x x) (* y y)))
        ( (and (not (< x y)) (not (< x z)) ) (+ (* y y) (* z z)))
        ( (and (not (< y z)) (not (< y z)) ) (+ (* z z) (* x x))))
)


; Exercise 1.4
; The procedure will select a different operator depending on the sign of b.


; Exercise 1.5
;(define (p) (p))
;(define (test x y)
;  (if (= x 0) 0 y)
;  )
;(test 0 (p))

; Substitution Model/ Applicative Order 
; Evaluate each the arguments and then apply
; 
; (test 0 (p))
; Eval test -> replace with body
; Eval 0 -> 0
; Eval -> (p) ----> Would get stuck evaluating (p)


; Normal-order Evaluation
; Fully expand and then reduce
;
; Will not evaluate parameters until they are needed
;
; (test 0 (p))
; Reduce ---> (if (= 0 0) 0 (p))
; Evaluate first parameter


; Exercise 1.6

#| (define (new_if predicate then-clause else-clause)
     (cond (predicate then-clause)
           (else else-clause)
     )
   )
   
   ; Here, new_if will evaluate ALL of its arguments, in particular, it will rerun cuberoot_iter_alt
   ; before evaluating new_if 
   (define (cuberoot_iter_alt guess x)
     (new_if (good-enough? guess x)
         guess
     (cuberoot_iter_alt (update guess x) x))
   )
   
   (define (cube_root_alt x) (cuberoot_iter_alt 1.0 x))
   
(define cube_root 27) |#



; Exercise 1.7
; TODO


;1.8 Helper method

(define (abs x)
  (cond
    ((< x 0) (- x))
    (else x)
    )
)


; Exercise 1.8

(define (cuberoot x) (cuberoot-iter 1.0 x))
   
(define (cuberoot-iter guess x)
  (if (good-enough? guess x)
      guess
  (cuberoot-iter (update guess x) x))
)

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 5.0)
)

(define (cube x)
  (* x x x)
)

(define (update guess x)
  (/
   (+ (/ x (* guess guess))
      (* 2 guess))
   3)
)

(cuberoot 27)


#lang scheme
(+ 137 349)
(- 1000 334)
(* 5 99)
(+ 21 35 12 7)
(+ (* 3 5) (- 10 6))

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))


(define size 2)
(* 5 size)



(define pi 3.14)
(define radius 10)  

(define circumference (* 2 pi radius))


(define (square x) (* x x))
(square 3)
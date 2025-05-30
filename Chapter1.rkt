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

(square (+ 2 5))

(define (sum-of-squares x y)
  (+ (square x ) (square  y))
)

(sum-of-squares 3 4)


(define (f a)
  (sum-of-squares (+ a 1) (* a 2))
)
(f 5)

(define (abs x)
  (cond ((< x 0) (- x))
        (else x))
)
(abs -3)
(abs (* 5 -250))


(define (abs2 x)
  (if (< x 0) (- x) x))
(abs2 -25)


(define (sum-square-min x y z)
  (cond ( (and (not (< z y)) (not (< z x)) ) (+ (* x x) (* y y)))
        ( (and (not (< x y)) (not (< x z)) ) (+ (* y y) (* z z)))
        ( (and (not (< y z)) (not (< y z)) ) (+ (* z z) (* x x))))
)
(sum-square-min -3 4 1)
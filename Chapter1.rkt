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




(define (wackyCond x y)
    (if (> x y) (+ x x) (+ y y))
)


(wackyCond 3 4)





(define (sqrt-itr guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-itr (improve guess x) x)
  )
)

(define (improve guess x)
  (average guess (/ x guess))
)

(define (average x y)
  (/ (+ x y) 2)
)


(define (good-enough? guess x)
  (< ( abs(- (square guess) x)) 0.000001)
)

(define (sqrt x) (sqrt-itr 1.0 x))

(sqrt 4)
(sqrt 9)
(sqrt 15)
(sqrt 99)
(sqrt 100)





(define (factorial1 n)
  ( if (= n 1)
       1
       (* n (factorial1 (- n 1)))
   ))

(factorial1 5)
(factorial1 10)




(define (factorial2 n)
  (factorial-iter 1 1 n)
  )

(define (factorial-iter product counter max-count)
  (if (> counter max-count)
      product
      (factorial-iter (* product counter) (+ counter 1) max-count)
   )
)

(factorial2 5)
(factorial2 10)




(define (factorial3 n)
  (define (factorial_iter product counter)
    (if (> counter n)
      product
      (factorial_iter (* product counter) (+ counter 1))
   ))
  (factorial_iter 1 1)
)

(factorial3 5)
(factorial3 10)





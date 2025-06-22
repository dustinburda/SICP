#lang scheme


; Exercise 1.29

#|
Using Simpson's rule, numerically integrate a function f between [a,b] using the following rule:

h/3(y0 + 4y1 + 2y2 + 4y3 + 2y4 + .... + 2yn-2  + 4yn-1 + yn)


where h = (b - a)/n

and

yk = f(a + kh)


Define a procedure that takes f, a, b, n and returns the value of the integral,
computing using Simpson's rule



Use your procedure to integrage cube between 0 and 1
|#

(define (cube x)
  (* x x x))


(define (simpsons f a b n)
  (define (h)
    (/ (- b a) n))
  (define (f-term k)
    (f (+ a (* k (h) ))))
  (define (term f a k)
    (cond ((= k 0) (f-term 0))
          ((= k n) (f-term n))
          ((= (remainder k 2) 0) (* 2 (f-term k)))
          ((= (remainder k 2) 1) (* 4 (f-term k)))))
  (define (sum-simpson-terms k)
    (if (= k n)
        0
        (+ (term f a k) (sum-simpson-terms (+ k 1)))))
  (* (/ (h) 3) (sum-simpson-terms 0)))

(simpsons cube 0.0 1.0 1000)



; Exercise 1.30

#|


(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


The sum procedure above returns a linear recursion. The procedure can be rewritten so that sum is performed iteratively.
Show how to do this by filling in the missing epxressions in the follow definitions
|#


(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))


(define (inc a)
  (+ a 1))

(sum cube 0 inc 10)




; Exercise 1.31


#|
Write a procedure called product (analogous to sum procedure above) that returns the product
of values of a function at points over a given range.

Write this product procedure to generate a recursive process
Write this product procedure to generate an iterative process


Show to define factorial in terms of product

Also use product to compute approximations of to pi using the formula

pi/4 = (2 * 4 * 4 * 6 * 6 * 8....) / (3 * 3 * 5 * 5 * 7 * 7...)
|#


; Recursive Process
(define (product-recur term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recur term (next a) next b))))

; Iterative Process
(define (product-iter term a next b)
  (define (iter start result)
    (if (> start b)
        result
        (iter (next start) (* result (term start)))))
  (iter a 1))


; Factorial Func
(define (factorial-recur n)
  (define (identity i) i)
  (define (inc i) (+ i 1))
  (product-recur identity 1 inc n))

(factorial-recur 5)

(define (factorial-iter n)
  (define (identity i) i)
  (define (inc i) (+ i 1))
  (product-iter identity 1 inc n))

(factorial-iter 5)



(define (square x)
  (* x x))

(define (pi-approx-recur n)
  (define (inc i) (+ i 1))
  (define (term i)
    (cond ((= 0 (remainder i 2)) (/ (+ i 2) (+ i 3)))
          ((= 1 (remainder i 2)) (/ (+ i 3) (+ i 2)))))
  (* 4.0 (product-recur term 0 inc n)))

(pi-approx-recur 10000)




(define (pi-approx-iter n)
  (define (inc i) (+ i 1))
  (define (term i)
    (cond ((= 0 (remainder i 2)) (/ (+ i 2) (+ i 3)))
          ((= 1 (remainder i 2)) (/ (+ i 3) (+ i 2)))))
  (* 4.0 (product-iter term 0 inc n)))

(pi-approx-iter 10000)


; Exercise 1.32
; Exercise 1.33
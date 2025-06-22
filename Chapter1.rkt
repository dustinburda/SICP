#lang scheme

#|
[DONE] Exercise 1.1
[DONE] Exercise 1.2
[DONE] Exercise 1.3
[DONE] Exercise 1.4
[DONE] Exercise 1.5
[DONE] Exercise 1.6
Exercise 1.7
[DONE] Exercise 1.8
[DONE] Exercise 1.9
[DONE] Exercise 1.10
[DONE] Exercise 1.11
Exercise 1.12
Exercise 1.13
[DONE] Exercise 1.14
[DONE] Exercise 1.15
[DONE] Exercise 1.16
[DONE] Exercise 1.17
[DONE] Exercise 1.18
Exercise 1.19
[DONE] Exercise 1.20
[DONE] Exercise 1.21
[DONE] Exercise 1.22
[DONE] Exercise 1.23
Exercise 1.24
Exercise 1.25
[DONE] Exercise 1.26
[DONE] Exercise 1.27
Exercise 1.28
[DONE] Exercise 1.29
[DONE] Exercise 1.30
[DONE] Exercise 1.31
[DONE] Exercise 1.32
[DONE] Exercise 1.33
Exercise 1.34
Exercise 1.35
Exercise 1.36
Exercise 1.37
Exercise 1.39
Exercise 1.40
Exercise 1.41
Exercise 1.42
Exercise 1.43
Exercise 1.44
Exercise 1.45
Exercise 1.46


|#













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


(define (fib n)
  (fib_iter 1 0 n))

(define (fib_iter a b count)
  (if (= count 0)
      b
      (fib_iter (+ a b) a (- count 1))))


(define (fib_recur n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((= n 2) 1)
        (else (+ (fib_recur (- n 2) ) (fib_recur (- n 1)) ) )))


(fib_recur 10)
(fib 10)





(define (count-change amount) (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination
                         kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))


(count-change 100)







(define (expt_recur b n)
  (cond ((= n 0) 1)
        (else (* b (expt_recur b (- n 1))))))

(expt_recur 2 5)


(define (expt b n)
  (expt_iter b n 1))

(define (expt_iter b n product)
  (cond ((= n 0) product)
        (else (expt_iter b (- n 1) (* b product)))))


(define (gcd a b)
  (cond ((= b 0) a)
        (else (gcd b (remainder a b) ))))


(gcd 35 25)





; Primality Testing


; Deterministic Test, O(n)


(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (=  n (smallest-divisor n)))



; Probabilistic Test, O(logn)


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
          (remainder
           (* base (expmod base (- exp 1) m))
           m))))


(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1))) ; Keep running if returns true everytime
        (else false))) ; If returns false, we know n is not prime





(define (sum-integers a b)
  (if (> a b)
      0
      (+ a
         (sum-integers (+ a 1) b))))


(sum-integers 0 10)


(define (cube x)
  (* x x x))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a)
         (sum-cubes (+ a 1) b))))

(sum-cubes 0 10)


(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))

(define (pi_approx n)
  (* 8 (pi-sum 1.0 n)))

(pi_approx 1000000)



(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))





(define (inc n)
  (+ n 1))

(define (sum-cubes-alt a b)
  (sum cube a inc b))


(sum-cubes-alt 0 10)





(define (identity x)
  x)

(define (sum-integers-alt a b)
  (sum identity a inc b))

(sum-integers-alt 0 10)




(define (pi-sum-alt a b)
  (define (pi-term x)
    (/ 1.0 ( * x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))


(* 8.0 (pi-sum 1 1000))




(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))






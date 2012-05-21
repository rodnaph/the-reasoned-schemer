#lang racket

(require rackunit)
(require "lib/mk.ss")

(define S (== #t #t))
(define U (== #t #f))

(define ans check-equal?)

; 11

(ans '(#t)
  (run* (q) 
    (== #t q)))

; 22

(ans '()
  (run* (x)
    (let ((x #f))
      (== #t x))))

; 23

(ans '(#t)
  (run* (q)
    (fresh (x)
      (== #t x)
      (== #t q))))

; 26

(ans '(#t)
  (run* (q)
    (fresh (x)
      (== x #t)
      (== #t q))))

; 27

(ans '(#t)
  (run* (q)
    (fresh (x)
      (== x #t)
      (== q #t))))

; 29

(ans '(_.0)
  (run* (x)
    (let ((x #f))
      (fresh (x)
        (== #t x)))))

; 30

(ans '((_.0 _.1))
  (run* (r)
    (fresh (x y)
      (== (cons x (cons y '())) r))))

; 31

(ans '((_.0 _.1))
  (run* (s)
    (fresh (t u)
      (== (cons t (cons u '())) s))))

; 32

(ans '((_.0 _.1 _.0))
  (run* (r)
    (fresh (x)
      (let ((y x))
        (fresh (x)
          (== (cons y (cons x (cons y '()))) r))))))

; 33

(ans '((_.0 _.1 _.0))
  (run* (r)
    (fresh (x)
      (let ((y x))
        (fresh (x)
          (== (cons x (cons y (cons x '()))) r))))))

; 34

(ans '()
  (run* (q)
    (== #f q)
    (== #t q)))

; 35

(ans '(#f)
  (run* (q)
    (== #f q)
    (== #f q)))

; 36

(ans '(#t)
  (run* (q)
    (let ((x q))
      (== #t x))))

; 37

(ans '(_.0)
  (run* (r)
    (fresh (x)
      (== x r))))

; 38

(ans '(#t)
  (run* (q)
    (fresh (x)
      (== #t x)
      (== x q))))

; 39

(ans '(#t)
  (run* (q)
    (fresh (x)
      (== x q)
      (== #t x))))

; 40

(ans '(#t)
  (run* (q)
    (fresh (x)
      (== #t x)
      (== x q))))

; 41

(ans #f
  (cond
    (#f #t)
    (else #f)))

; 43

(ans #f
  (cond
    (#f #t)
    (else #f)))

; 44

  (conde
    (U S)
    (else U))


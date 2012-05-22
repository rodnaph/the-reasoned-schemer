#lang racket

(require "lib/rs.ss")

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

; 47

(ans '(olive oil) 
  (run* (x)
    (conde
      ((== 'olive x) S)
      ((== 'oil x) S)
      (U))))

; 49

(ans '(olive)
  (run 1 (x)
    (conde
      ((== 'olive x) S)
      ((== 'oil x) S)
      (U))))

; 50

(ans '(olive _.0 oil)
  (run* (x)
    (conde
      ((== 'virgin x) U)
      ((== 'olive x) S)
      (S S)
      ((== 'oil x) S)
      (U))))

; 52

(ans '(extra olive)
  (run 2 (x)
    (conde
      ((== 'extra x) S)
      ((== 'virgin x) U)
      ((== 'olive x) S)
      ((== 'oil x) S))))

; 53

(ans '((split pea))
  (run* (r)
    (fresh (x y)
      (== 'split x)
      (== 'pea y)
      (== (cons x (cons y '())) r))))

; 54

(ans '((split pea soup) (navy bean soup))
  (run* (r)
    (fresh (x y)
      (conde
        ((== 'split x) (== 'pea y))
        ((== 'navy x) (== 'bean y))
        (U))
      (== (cons x (cons y (cons 'soup '()))) r))))

; 56

(define teacupo
  (lambda (x)
    (conde
      ((== 'tea x) S)
      ((== 'cup x) S)
      (U))))

(ans '(tea cup)
  (run* (x)
    (teacupo x)))


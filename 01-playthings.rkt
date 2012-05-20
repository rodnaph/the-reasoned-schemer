#lang racket

(require rackunit)
(require "lib/mk.ss")

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


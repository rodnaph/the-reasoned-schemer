#lang racket

(require "mk.ss")

; 11

(run* (q) 
  (== #t q))

;(run 1 (q) 
; (fresh (x y)
;  (conde
;    ((== "split" x) (== "pea" y)))
;  (== (cons x (cons y '())) q)))


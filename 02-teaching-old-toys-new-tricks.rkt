#lang racket

(require "lib/rs.ss")

; 1

(ans 'c
  (let ((x (lambda (a) a))
        (y 'c))
    (x y)))


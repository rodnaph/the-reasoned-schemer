#lang racket

(require "lib/rs.ss")

; 1

(ans #t
  (pair? '((a) (a b) c)))

; 2

(ans #t
  (list? '()))

; 3

(ans #f
  (list? 's))

; 4

(ans #f
  (list? '(d a t e . s)))

; 7

(ans '(_.0)
  (run* (x)
    (listo (list 'a 'b x 'd))))

; 10

(ans '()
  (run 1 (x)
    (listo '(a b c . x))))


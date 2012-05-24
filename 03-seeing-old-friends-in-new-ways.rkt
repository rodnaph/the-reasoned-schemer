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

(ans '(())
  (run 1 (x)
    (listo (cons '(a b c) x))))

; 13

; non-terminating
;(ans '()
;  (run* (x)
;    (listo (cons '(a b c) x))))

; 14

(ans '(()
       (_.0)
       (_.0 _.1)
       (_.0 _.1 _.2)
       (_.0 _.1 _.2 _.3))
  (run 5 (x)
    (listo (cons '(a b c) x))))


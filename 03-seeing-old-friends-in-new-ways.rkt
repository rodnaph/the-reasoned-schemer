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

; 20

(ans '(())
  (run 1 (l)
    (lolo l)))

; 21

(ans '(#t)
  (run* (q)
    (fresh (x y)
      (lolo (list '(a b) (list x 'c) (list 'd y)))
      (== #t q))))

; 22

(ans '(#t)
  (run 1 (q)
    (fresh (x)
      (lolo (list '(a b) x))
      (== #t q))))

; 23

(ans '(())
  (run 1 (x)
    (lolo (list '(a b) '(c d) x))))

; 24

; @todo
;(ans '(()
;       (())
;       (() ())
;       (() () ())
;       (() () () ()))
;  (run 5 (x)
;    (lolo (list '(a b) '(c d) x))))
    
; 32

(ans '(#t)
  (run* (q)
    (twinso '(tofu tofu))
    (== #t q)))

; 33

(ans '(tofu)
  (run* (z)
    (twinso (list z 'tofu))))

; 38

(ans '(())
  (run 1 (z)
    (loto (cons '(g g) z))))

; 42

(ans '(()
       ((_.0 _.0))
       ((_.0 _.0) (_.1 _.1))
       ((_.0 _.0) (_.1 _.1) (_.2 _.2))
       ((_.0 _.0) (_.1 _.1) (_.2 _.2) (_.3 _.3)))
  (run 5 (z)
    (loto (cons '(g g) z))))

; 44

(ans '((e (_.0 _.0) (_.1 _.1)))
  (run 5 (r)
    (fresh ( w x y z)
      (loto (list '(g g) (list 'e w) (list x y) z))
      (== (list w (list x y) z) r))))


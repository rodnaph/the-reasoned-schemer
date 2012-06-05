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

; 45

(ans '((e (_.0 _.0) ())
       (e (_.0 _.0) ((_.1 _.1)))
       (e (_.0 _.0) ((_.1 _.1) (_.2 _.2)))
       (e (_.0 _.0) ((_.1 _.1) (_.2 _.2) (_.3 _.3)))
       (e (_.0 _.0) ((_.1 _.1) (_.2 _.2) (_.3 _.3) (_.4 _.4))))
  (run 5 (r)
    (fresh (w x y z)
      (loto (list* '(g g) (list 'e w) (list x y) z))
      (== (list w (list x y) z) r))))

; 47

(ans '(((g g) (e e) (_.0 _.0))
       ((g g) (e e) (_.0 _.0) (_.1 _.1))
       ((g g) (e e) (_.0 _.0) (_.1 _.1) (_.2 _.2)))
  (run 3 (out)
    (fresh (w x y z)
      (== (list* '(g g) (list 'e w) (list x y) z) out)
      (loto out))))

; 53

(ans #t
  (member? 'olive '(virgin olive oil)))

; 57

(ans '(#t)
  (run* (q)
    (membero 'a '(b a))
    (== #t q)))

; 58

(ans '(hummus)
  (run 1 (y)
    (membero y '(hummus with pita))))

; 59

(ans '(with)
  (run 1 (y)
    (membero y '(with pita))))

; 60

(ans '(pita)
  (run 1 (y)
    (membero y '(pita))))

; 61

(ans '()
  (run* (y)
    (membero y '())))

; 62

(ans '(hummus with pita)
  (run* (y)
    (membero y '(hummus with pita))))

; 65

(ans '(a b c)
  (identity '(a b c)))

; 66

(ans '(e)
  (run* (x)
    (membero 'e (list 'pasta x 'fagioli))))

; 69

(ans '(_.0)
  (run 1 (x)
    (membero 'e (list 'pasta 'e x 'fagioli))))

; 70

(ans '(e)
  (run 1 (x)
    (membero 'e (list 'pasta x 'e 'fagioli))))

; 71

(ans '((e _.0) (_.0 e))
  (run* (r)
    (fresh (x y)
      (membero 'e (list 'pasta x 'fagioli y))
      (== (list x y) r))))

; 73

(ans '((tofu . _.0))
  (run 1 (l)
    (membero 'tofu l)))

; 75

; non-termintating
;(ans '()
;  (run* (l)
;    (membero 'tofu l)))

; 76

(ans '((tofu . _.0)
       (_.0 tofu . _.1)
       (_.0 _.1 tofu . _.2)
       (_.0 _.1 _.2 tofu . _.3)
       (_.0 _.1 _.2 _.3 tofu . _.4))
  (run 5 (l)
    (membero 'tofu l)))

; 80

(ans '((tofu)
       (_.0 tofu)
       (_.0 _.1 tofu)
       (_.0 _.1 _.2 tofu)
       (_.0 _.1 _.2 _.3 tofu))
  (run 5 (l)
    (pmembero 'tofu l)))

; 81

(ans '(#t)
  (run* (q)
    (pmembero 'tofu '(a b tofu d tofu))
    (== #t q)))

; 95

(ans '(pasta)
  (first-value '(pasta e fagioli)))

; 100

; @todo - reverse not working
;
;(ans '(fagioli e pasta)
;  (run* (x)
;    (memberrevo x '(pasta e fagioli))))
;
;; 101
;
;(ans '(c b a)
;  (reverse-list '(a b c)))


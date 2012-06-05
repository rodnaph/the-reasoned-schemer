#lang racket

(require "lib/rs.ss")

; 1

(ans '(tofu d peas e)
  (mem 'tofu '(a b tofu d peas e)))

; 2

(ans #f
  (mem 'tofu '(a b peas d peas e)))

; 3

(ans '((tofu d peas e))
  (run* (out)
    (== (mem 'tofu '(a b tofu d peas e)) out)))

; 4

(ans '(peas e)
  (mem 'peas
    (mem 'tofu '(a b tofu peas e))))

; 5

(ans '(tofu d tofu e)
  (mem 'tofu
    (mem 'tofu '(a b tofu d tofu e))))

; 6

(ans '(tofu e)
  (mem 'tofu
    (cdr (mem 'tofu '(a b tofu d tofu e)))))

; 10

(ans '((tofu d tofu e))
  (run 1 (out)
    (memo 'tofu '(a b tofu d tofu e) out)))

; 11

(ans '((tofu d tofu e))
  (run 1 (out)
    (fresh (x)
      (memo 'tofu (list 'a 'b x 'd 'tofu 'e) out))))

; 12

(ans '(tofu)
  (run* (r)
    (memo r
      '(a b tofu d tofu e)
      '(tofu d tofu e))))

; 13

(ans '(#t)
  (run* (q)
    (memo 'tofu '(tofu e) '(tofu e))
    (== #t q)))

; 14

(ans '()
  (run* (x)
    (memo 'tofu '(tofu e) (list 'peas x))))

; 15

(ans '((tofu d tofu e)
       (tofu e))
  (run* (out)
    (fresh (x)
      (memo 'tofu (list 'a 'b x 'd 'tofu 'e) out))))

; 16 (cut short to save typing :P)

(ans '(_.0
       _.0
       (tofu . _.0)
       (_.0 tofu . _.1)
       (_.0 _.1 tofu . _.2)
       (_.0 _.1 _.2 tofu . _.3))
  (run 6 (z)
    (fresh (u)
      (memo 'tofu (list* 'a 'b 'tofu 'd 'tofu 'e z) u))))

; 23

(ans '(a b d peas e)
  (rember 'peas '(a b peas d peas e)))

; 30

(ans '((a b d peas e))
  (run 1 (out)
    (fresh (y)
      (rembero 'peas (list 'a 'b y 'd 'peas 'e) out))))

; 31

(ans '((b a d _.0 e)
       (a b d _.0 e)
       (a b d _.0 e)
       (a b d _.0 e)
       (a b _.0 d e)
       (a b e d _.0)
       (a b _.0 d _.1 e))
  (run* (out)
    (fresh (y z)
      (rembero y (list 'a 'b y 'd z 'e) out))))

; 49

(ans '((d d)
       (d d)
       (_.0 _.0)
       (e e))
  (run* (r)
    (fresh (y z)
      (rembero y (list y 'd z 'e) (list y 'd 'e))
      (== (list y z) r))))

; 57

(ans '(_.0
       _.0
       _.0
       _.0
       _.0
       ()
       (_.0 . _.1)
       (_.0)
       (_.0 _.1 . _.2)
       (_.0 _.1)
       (_.0 _.1 _.2 . _.3)
       (_.0 _.1 _.2)
       (_.0 _.1 _.2 _.3 . _.4))
  (run 13 (w)
    (fresh (y z out)
      (rembero y (list* 'a 'b y 'd z w) out))))

; 69

(ans '(d)
  (run* (r)
    (== 'd r)
    (surpriso r)))

; 70

(ans '(_.0)
  (run* (r)
    (surpriso r)))


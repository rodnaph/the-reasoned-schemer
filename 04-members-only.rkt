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


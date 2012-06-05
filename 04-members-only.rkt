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


#lang racket

(require "lib/rs.ss")

; 1

(ans 'c
  (let ((x (lambda (a) a))
        (y 'c))
    (x y)))

; 2

(ans '((_.0 _.1))
  (run* (r)
    (fresh (y x)
      (== (list x y) r))))

; 3

(ans '((_.0 _.1))
  (run* (r)
    (fresh (v w)
      (== (let ((x v) 
                (y w)) 
            (list x y)) r))))

; 4

(ans 'grape
  (car '(grape raisin pear)))

; 5

(ans 'a
  (car '(a c o r n)))

; 6

(ans '(a)
  (run* (r)
    (caro '(a c o r n) r)))

; 7

(ans '(#t)
  (run* (q)
    (caro '(a c o r n) 'a)
    (== #t q)))

; 8

(ans '(pear)
  (run* (r)
    (fresh (x y)
      (caro (list r y) x)
      (== 'pear x))))

; 10

(ans '(grape a)
  (cons
    (car '(grape raisin pear))
    (car '((a) (b) (c)))))

; 11

(ans '((grape a))
  (run* (r)
    (fresh (x y)
      (caro '(grape raisin pear) x)
      (caro '((a) (b) (c)) y)
      (== (cons x y) r))))

; 13

(ans '(raisin pear)
  (cdr '(grape raisin pear)))

; 14

(ans 'c
  (car (cdr '(a c o r n))))

; 15

(ans '(c)
  (run* (r)
    (fresh (v)
      (cdro '(a c o r n) v)
      (caro v r))))

; 17

(ans '((raisin pear) a)
  (cons
    (cdr '(grape raisin pear))
    (car '((a) (b) (c)))))

; 18

(ans '(((raisin pear) a))
  (run* (r)
    (fresh (x y)
      (cdro '(grape raisin pear) x)
      (caro '((a) (b) (c)) y)
      (== (cons x y) r))))

; 19

(ans '(#t)
  (run* (q)
    (cdro '(a c o r n) '(c o r n))
    (== #t q)))

; 20

(ans '(o)
  (run* (x)
    (cdro '(c o r n) (list x 'r 'n))))

; 21

(ans '((a c o r n))
  (run* (l)
    (fresh (x)
      (cdro l '(c o r n))
      (caro l x)
      (== 'a x))))

; 22

(ans '(((a b c) d e))
  (run* (l)
    (conso '(a b c) '(d e) l)))

; 23

(ans '(d)
  (run* (x)
    (conso x '(a b c) '(d a b c))))

; 24

(ans '((e a d c))
  (run* (r)
    (fresh (x y z)
      (== (list 'e 'a 'd x) r)
      (conso y (list 'a z 'c) r))))

; 25

(ans '(d)
  (run* (x)
    (conso x (list 'a x 'c) (list 'd 'a x 'c))))

; 26

(ans '((d a d c))
  (run* (l)
    (fresh (x)
      (== (list 'd 'a x 'c) l)
      (conso x (list 'a x 'c) l))))

; 27

(ans '((d a d c))
  (run* (l)
    (fresh (x)
      (conso x (list 'a x 'c) l)
      (== (list 'd 'a x 'c) l))))


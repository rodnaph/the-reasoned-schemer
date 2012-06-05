(module reasonschemer mzscheme

  (require rackunit)
  (require "mk.ss")

  (provide == conde fresh run run* conda condu project U S ans
           ; 02
           caro cdro conso nullo eqo pairo 
           ; 03
           listo lolo twinso loto member? eq-car? membero eq-caro identity
           pmembero first-value memberrevo reverse-list
           ; 04
           mem
  )

  (define S (== #t #t))
  (define U (== #t #f))

  (define caro
    (lambda (p a)
      (fresh (d)
        (== (cons a d) p))))

  (define cdro
    (lambda (p d)
      (fresh (a)
        (== (cons a d) p))))

  (define conso
    (lambda (a d p)
      (== (cons a d) p)))

  (define nullo
    (lambda (x) 
      (== '() x)))

  (define eqo
    (lambda (x y)
      (== x y)))

  (define pairo
    (lambda (p)
      (fresh (a d)
        (conso a d p))))

  (define listo
    (lambda (l)
      (conde
        ((nullo l) S)
        ((pairo l)
         (fresh (d)
           (cdro l d)
           (listo d))))))

  (define listof
    (lambda (f l)
      (conde
        ((nullo l) S)
        ((fresh (a)
           (caro l a)
           (f a))
         (fresh (d)
           (cdro l d)
           (listof f d))))))

  (define lolo
    (lambda (l)
      (listof listo l)))

  (define twinso
    (lambda (s)
      (fresh (x)
        (== (list x x) s))))

  (define loto
    (lambda (l)
      (listof twinso l)))

  (define eq-car?
    (lambda (l x)
      (eq? (car l) x)))

  (define member?
    (lambda (x l)
      (cond
        ((null? l) #f)
        ((eq-car? l x) #t)
        (else (member? x (cdr l))))))

  (define eq-caro
    (lambda (l x)
      (caro l x)))

  (define membero
    (lambda (x l)
      (conde
        ((nullo l) U)
        ((eq-caro l x) S)
        ((fresh (d)
          (cdro l d)
          (membero x d))))))

  (define identity
    (lambda (x)
      (run* (y)
        (membero y x))))

  (define pmembero
    (lambda (x l)
      (conde
        ((nullo l) U)
        ((eq-caro l x) (cdro l '()))
        ((fresh (d)
           (cdro l d)
           (pmembero x d))))))

  (define first-value
    (lambda (l)
      (run 1 (y)
        (membero y l))))

  (define memberrevo
    (lambda (x l)
      (conde
        ((nullo l) U)
        (S (fresh (d)
           (cdro l d)
           (memberrevo x d)))
        ((eq-caro l x)))))

  (define reverse-list
    (lambda (l)
      (run* (x)
        (memberrevo x l))))

  (define mem
    (lambda (x l)
      (cond
        ((null? l) #f)
        ((eq-car? l x) l)
        (else (mem x (cdr l))))))

  (define ans 
    (lambda (x y)
      (check-equal? y x))))


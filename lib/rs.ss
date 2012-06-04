(module reasonschemer mzscheme

  (require rackunit)
  (require "mk.ss")

  (provide == conde fresh run run*
           conda condu project
           ; 02
           caro cdro conso nullo eqo pairo 
           ; 03
           listo lolo twinso loto member? eq-car? membero eq-caro
           U S ans)

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

  (define ans 
    (lambda (x y)
      (check-equal? y x))))


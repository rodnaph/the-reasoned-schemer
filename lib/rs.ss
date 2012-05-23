(module reasonschemer mzscheme

  (require rackunit)
  (require "mk.ss")

  (provide == conde fresh run run*
           conda condu project
           ;
           caro cdro conso nullo eqo
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

  (define ans 
    (lambda (x y)
      (check-equal? y x))))


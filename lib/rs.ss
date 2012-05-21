(module reasonschemer mzscheme

  (require rackunit)
  (require "mk.ss")

  (provide == conde fresh run run*
           conda condu project
           U S ans)

  (define S (== #t #t))
  (define U (== #t #f))

  (define ans check-equal?))


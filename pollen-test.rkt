#lang racket
(require rackunit txexpr "pollen.rkt")

(module+ test
  (test-case "zero renders as a row of bits"
    (define tbl (deci->bin-table 0 4))
    (define body (findf (lambda (el) (eq? (get-tag el) 'tbody)) (get-elements tbl)))
    (check-equal? (get-elements body)
                  '((tr (td "0") (td "0") (td "0") (td "0"))))))

(module+ test
  (test-case "binary conversion validates widths and preserves signed callers"
    (define (binary n [width 0]) (list->string (deci->binary n #:width width)))
    (check-equal? (binary 0) "0")
    (check-equal? (binary 0 4) "0000")
    (check-equal? (binary 15 4) "1111")
    (check-equal? (binary 16 5) "10000")
    (check-equal? (binary -8 4) "-1000")
    (check-equal? (binary -1 4) "-1111")
    (check-equal? (binary -1 1) "-1")
    (for ([input '((8 2) (16 4) (-9 4) (-2 1))])
      (check-exn #rx"does not fit" (lambda () (binary (first input) (second input)))))
    (check-exn #rx"must provide" (lambda () (binary -1)))
    (check-exn exn:fail:contract? (lambda () (binary 1 -1)))
    (check-exn exn:fail:contract? (lambda () (binary 1 1/2)))
    (check-exn exn:fail:contract? (lambda () (binary 1/2)))))

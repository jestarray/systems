#lang racket
(require rackunit txexpr "pollen.rkt")

(module+ test
  (test-case "video queries retain parameters and set autoplay once"
    (define (srcdoc link)
      (attr-ref (second (get-elements (yt link))) 'srcdoc))
    (check-true (string-contains? (srcdoc "abc") "href=\"https://www.youtube.com/embed/abc?autoplay=1\""))
    (check-true (string-contains? (srcdoc "abc?start=60") "abc?start=60&amp;autoplay=1"))
    (define existing (srcdoc "abc?start=60&autoplay=0"))
    (check-true (string-contains? existing "abc?start=60&amp;autoplay=1"))
    (check-equal? (length (regexp-match* #rx"autoplay=" existing)) 1)
    (check-true (string-contains? existing "/vi/abc/hqdefault.jpg"))))

(module+ test
  (test-case "list helpers preserve tagged items and accept empty collections"
    (define items (list (red "a") (blue "b")))
    (check-equal? (list->li) empty)
    (check-equal? (list->li empty) empty)
    (check-equal? (apply list->li items) (list->li items))
    (check-equal? (map (compose first get-elements) (apply list->li items)) items)
    (check-equal? (get-elements (steps)) empty)
    (check-equal? (length (get-elements (steps (step "a") (step "b")))) 2))
  (test-case "table helpers accept empty rows and tagged cells"
    (check-equal? (get-elements (table-entries)) empty)
    (check-equal? (get-elements (table-entries empty)) empty)
    (check-equal? (get-elements (table-entries (list empty))) '((tr)))
    (define row (list (red "a") (blue "b")))
    (check-equal? (table-entries row) (table-entries (list row)))
    (check-equal? (table-entries (list 0 1) (list 1 0))
                  (table-entries (list (list 0 1) (list 1 0))))))

(module+ test
  (test-case "book index contains no nested anchors"
    (define toc (generate-toc (dynamic-require "index.ptree" 'doc)))
    (define (check-links element [inside-link? #f])
      (when (txexpr? element)
        (define link? (eq? (get-tag element) 'a))
        (check-false (and inside-link? link?))
        (for ([child (get-elements element)])
          (check-links child (or inside-link? link?)))))
    (check-links toc)))

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

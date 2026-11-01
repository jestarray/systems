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
  (test-case "tables preserve cell content, headers, and optional body styling"
    (define markup (red "a"))
    (define tbl (table #:headings '("A" "B" "C")
                       #:rows (list (list markup 2 #\0))
                       #:monospace? #t #:attrs '((id "bits"))))
    (check-equal? (attr-ref tbl 'id) "bits")
    (check-equal? (get-elements tbl)
                  `((thead (tr (th ((scope "col")) "A")
                               (th ((scope "col")) "B")
                               (th ((scope "col")) "C")))
                    (tbody ((class "table-monospace"))
                           (tr (td ,markup) (td "2") (td "0")))))
    (check-equal? (get-attrs (second (get-elements
                                   (table #:headings '("A") #:rows empty)))) empty))
  (test-case "table captions accept text, markup, and mixed content"
    (define markup (red "AND"))
    (for ([caption (list "AND" markup (list "Gate: " markup))]
          [expected (list '("AND") (list markup) (list "Gate: " markup))])
      (check-equal? (first (get-elements (table #:headings empty #:rows empty
                                              #:caption caption)))
                    (txexpr 'caption empty expected)))
    (for ([caption (list #f empty "")])
      (define tbl (table #:headings empty #:rows empty #:caption caption))
      (check-equal? (length (get-elements tbl)) (if (equal? caption "") 3 2))))
  (test-case "tables reject malformed rows and unsupported content"
    (check-exn #rx"row 2: expected 2 cells, received 1"
               (lambda () (table #:headings '("A" "B") #:rows '((0 1) (0)))))
    (check-exn #rx"expected a row list"
               (lambda () (table #:headings '("A") #:rows '(0))))
    (for ([make-bad-table
           (list (lambda () (table #:headings "A" #:rows empty))
                 (lambda () (table #:headings empty #:rows 0))
                 (lambda () (table #:headings '("A") #:rows '((#t))))
                 (lambda () (table #:headings empty #:rows empty #:caption 42))
                 (lambda () (table #:headings empty #:rows empty #:attrs "bad"))
                 (lambda () (table #:headings empty #:rows empty #:monospace? 1)))])
      (check-exn exn:fail:contract? make-bad-table))))


(module+ test
  (test-case "decoded book index keeps links unwrapped and unnested"
    (define toc (generate-toc (dynamic-require "index.ptree" 'doc)))
    (define decoded-toc (first (get-elements (root toc))))
    (check-equal? decoded-toc toc)
    (define (check-links element [inside-link? #f])
      (when (txexpr? element)
        (check-not-equal? (get-tag element) 'p)
        (define link? (eq? (get-tag element) 'a))
        (check-false (and inside-link? link?))
        (for ([child (get-elements element)])
          (check-links child (or inside-link? link?)))))
    (check-links decoded-toc)
    (check-equal? (get-elements (root "First paragraph." "\n\n" "Second paragraph."))
                  '((p "First paragraph.") (p "Second paragraph.")))))

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

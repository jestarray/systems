<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="/theme.js?v=2"></script>
    <link href="https://unpkg.com/sanitize.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" media="all" href="/styles.css?v=5" />
    ◊(define has-code-block? (select 'code doc))
    ◊when/splice[has-code-block?]{
    <script src="/prism_highlight.js"></script>
    <link rel="stylesheet" type="text/css" media="all" href="/prism.css" />
    }
    <script src="./slide_mode.js?v=3"></script>
    <!-- Cloudflare Web Analytics --><script defer src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{"token": "268f8e8ed1cf4189996214dfee7b9d3e"}'></script><!-- End Cloudflare Web Analytics -->
    <link rel="icon" href="/images/favicon.svg" type="image/svg+xml">
    <title>◊select['h1 doc]</title>
</head>

<body>
    <div class="container">
        <main class="main-wrapper">
            <div class="page-tools">
                <button id="theme-toggle" type="button" aria-label="Dark mode" aria-pressed="false" title="Switch to dark mode" hidden>
                    <svg class="theme-icon theme-icon-moon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                        <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79Z" />
                    </svg>
                    <svg class="theme-icon theme-icon-sun" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" aria-hidden="true" focusable="false">
                        <circle cx="12" cy="12" r="4" />
                        <path d="M12 2v2 M12 20v2 M2 12h2 M20 12h2 M4.93 4.93l1.42 1.42 M17.65 17.65l1.42 1.42 M4.93 19.07l1.42-1.42 M17.65 6.35l1.42-1.42" />
                    </svg>
                </button>
            </div>
            <nav>
            ◊(define prev-page (previous here))
            ◊when/splice[prev-page]{
            <div id="prev">← <a href="/◊|prev-page|"> ◊(select 'h1 prev-page)</a></div>}
            <div id="home"><a href="/index.html">Index</a></div>
            ◊(define next-page (next here))
            ◊when/splice[next-page]{
            <div id="next"><a href="/◊|next-page|">◊(select 'h1 next-page)</a> →</div>}
            ◊(define has-slides? (select 'section doc))
            ◊when/splice[has-slides?]{
                <div id="home"><a href="javascript:void(0)" onclick="slide_mode()">Slide Mode</a></div>
            }
            </nav>
            ◊(define page-doc (prepare-page-document doc))
            <div class="page-layout">
                <article>
                    ◊(->html page-doc #:splice? #t)
                </article>
                ◊(->html (generate-page-toc page-doc))
            </div>
        </main>
    </div>
</body>

</html>

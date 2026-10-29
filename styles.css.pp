#lang pollen

:root {
    color-scheme: light;
    --page-bg: #fff;
    --page-text: #202124;
    --link: #0645ad;
    --visited-link: #663399;
    --surface-bg: #f2f2f2;
    --table-heading-bg: #e0e0e0;
    --table-border: #cbcbcb;
    --border: #aaa;
    --question: #07a;
    --step: purple;
    --examples: green;
    --anchor: #c2c2c2;
    --api-bg: #b2b2b2;
    --inline-code-bg: rgba(175,184,193,0.2);
    --lesson-red: red;
    --lesson-blue: blue;
    --lesson-green: green;
}

:root[data-theme="dark"] {
    color-scheme: dark;
    --page-bg: #111418;
    --page-text: #e3e8ef;
    --link: #8ab4f8;
    --visited-link: #c5a5ef;
    --surface-bg: #1b222c;
    --table-heading-bg: #273240;
    --table-border: #44505f;
    --border: #556171;
    --question: #88cfff;
    --step: #d8a7ef;
    --examples: #87d79a;
    --anchor: #929eae;
    --api-bg: #273240;
    --inline-code-bg: rgba(175,184,193,0.15);
    --lesson-red: #ff8b89;
    --lesson-blue: #8ab4f8;
    --lesson-green: #87d79a;
}

html,
body {
    background-color: var(--page-bg);
    color: var(--page-text);
}

.page-tools {
    display: flex;
    justify-content: flex-end;
    margin-block: 1rem;
}

#theme-toggle {
    width: 2.75rem;
    padding: .5rem;
    min-height: 2.75rem;
    border: 1px solid var(--border);
    border-radius: 50%;
    background-color: var(--surface-bg);
    color: var(--page-text);
    font: inherit;
    cursor: pointer;
}

#theme-toggle:not([hidden]) {
    display: grid;
    place-items: center;
}

.theme-icon {
    width: 1.25rem;
    height: 1.25rem;
}

.theme-icon-sun,
:root[data-theme="dark"] .theme-icon-moon {
    display: none;
}

:root[data-theme="dark"] .theme-icon-sun {
    display: block;
}

#theme-toggle:hover,
#theme-toggle[aria-pressed="true"] {
    background-color: var(--table-heading-bg);
}

#theme-toggle:focus-visible {
    outline: 2px solid var(--link);
    outline-offset: 3px;
}

/* Give transparent diagrams a light canvas so black labels stay readable. */
:root[data-theme="dark"] article img {
    background-color: #fff;
    border-radius: 4px;
}

table {
    /* Remove spacing between table cells (from Normalize.css) */
    border-collapse: collapse;
    border-spacing: 0;
    empty-cells: show;
    border: 1px solid var(--table-border);
    table-layout: fixed;
}

 caption {
    padding: 1em 0;
    text-align: center;
    caption-side: bottom;
}

 td,
 th {
    border-left: 1px solid var(--table-border);/*  inner column border */
    border-width: 0 0 0 1px;
    font-size: inherit;
    margin: 0;
    overflow: visible; /*to make ths where the title is really long work*/
    padding: 0.5em 1em; /* cell padding */
}

 thead {
    background-color: var(--table-heading-bg);
    color: var(--page-text);
    text-align: left;
    vertical-align: bottom;
}

/*
striping:
   even - #fff (white)
   odd  - #f2f2f2 (light gray)
*/
td {
    background-color: transparent;
}
/* nth-child selector for modern browsers */
tr:nth-child(odd) td {
    background-color: var(--surface-bg);
}
/* BORDERED TABLES */
td {
    border-bottom: 1px solid var(--table-border);
}
tbody > tr:last-child > td {
    border-bottom-width: 0;
}

/* HORIZONTAL BORDERED TABLES */

.pure-table-horizontal td,
.pure-table-horizontal th {
    border-width: 0 0 1px 0;
    border-bottom: 1px solid var(--table-border);
}
.pure-table-horizontal tbody > tr:last-child > td {
    border-bottom-width: 0;
}
/**
 * Use the default user interface font in all browsers (opinionated).
 */

html {
  font-family:
     /* macOS 10.11-10.12 */ -apple-system,
    /* Windows 6+ */ "Segoe UI",
    /* Android 4+ */ "Roboto",
    /* Ubuntu 10.10+ */ "Ubuntu",
    /* KDE Plasma 5+ */ "Noto Sans",
    /* Gnome 3+ */ "Cantarell",
    /* fallback */ sans-serif,
    /* macOS emoji */ "Apple Color Emoji",
    /* Windows emoji */ "Segoe UI Emoji",
    /* Windows emoji */ "Segoe UI Symbol",
    /* Linux emoji */ "Noto Color Emoji",
    system-ui;
}

/**
 * Use the default monospace user interface font in all browsers (opinionated).
 */

code,
kbd,
samp,
pre {
  font-family:
    /* macOS 10.10+ */ "Menlo",
    /* Windows 6+ */ "Consolas",
    /* Android 4+ */ "Roboto Mono",
    /* Ubuntu 10.10+ */ "Ubuntu Monospace",
    /* KDE Plasma 5+ */ "Noto Mono",
    /* KDE Plasma 4+ */ "Oxygen Mono",
    /* Linux/OpenOffice fallback */ "Liberation Mono",
    /* fallback */ monospace,
    /* macOS emoji */ "Apple Color Emoji",
    /* Windows emoji */ "Segoe UI Emoji",
    /* Windows emoji */ "Segoe UI Symbol",
    /* Linux emoji */ "Noto Color Emoji";
}


a{
    /* remove underline */
    text-decoration: none;
    color: var(--link);
}

a:visited {
    color: var(--visited-link);
}

.question {
    color: var(--question);
}

.steps {
    list-style-position: none;
}

.step {
    color: var(--step);
}

.more-examples{
    color: var(--examples);
}

.anchor {
    float: left;
    padding-right: 4px;
    margin-left: -20px;
    line-height: 1;
    text-decoration: none;
    color: var(--anchor);
    opacity: .9;
    font-size: 65%;
}

details {
    border: 1px solid var(--border);
    border-radius: 4px;
    padding: .5em .5em 0;
}

summary {
    font-weight: bold; 
    margin: -.5em -.5em 0;
    padding: .5em;
}

details[open] {
    padding: .5em;
}

details[open] summary {
    border-bottom: 1px solid var(--border);
    margin-bottom: .5em;
}
/* LAYOUT */
/* 
    prev search next
    .   content .
    . content .
*/
#prev {
    grid-area: prev;
    direction: rtl;
}

#next {
    grid-area: next;
    direction: rtl;
}

#home {
    grid-area: home;
    direction: rtl;
}

.container {
        grid-template-areas: 
        ". content .";
        display: grid;
        grid-template-columns: minmax(1em, 1fr) minmax(auto, 90ch) minmax(1em, 1fr);
        height: 100vh;
}

article {
    grid-area: article;
}

.main-wrapper {
    grid-area: content;
    min-width: 0;
}

.page-layout {
    display: grid;
    grid-template-areas: "toc" "article";
    grid-template-columns: minmax(0, 1fr);
    gap: 1.5rem;
    margin-top: 1.5rem;
}

.page-layout > article {
    min-width: 0;
}

.table-scroll {
    max-width: 100%;
    overflow-x: auto;
}

.table-scroll:focus-visible {
    outline: 2px solid var(--link);
    outline-offset: 2px;
}

article :is(h1, h2, h3, h4, h5, h6) {
    scroll-margin-top: 1.5rem;
}

.page-toc {
    grid-area: toc;
    align-self: start;
    min-width: 0;
    max-height: 20rem;
    overflow-y: auto;
    padding-inline: 1rem .5rem;
    border-inline-start: 1px solid var(--border);
    font-size: .875rem;
    line-height: 1.5;
    overflow-wrap: anywhere;
}

#page-toc-title {
    margin: 0 0 .75rem;
    font-weight: 600;
}

.page-toc ul {
    list-style: none;
    margin: 0;
    padding: 0;
}

.page-toc ul ul {
    padding-inline-start: .75rem;
}

.page-toc a,
.page-toc a:visited {
    display: block;
    padding: .3rem .4rem;
    border-radius: 4px;
    background-image: none;
    color: var(--page-text);
}

.page-toc a:hover,
.page-toc a:focus-visible {
    background-color: var(--surface-bg);
    color: var(--link);
}

.page-toc a:focus-visible {
    outline: 2px solid var(--link);
    outline-offset: -2px;
}

@media (min-width: 70rem) {
    body:not(.slide-mode) .container {
        grid-template-columns: minmax(1em, 1fr) minmax(0, calc(90ch + 18rem)) minmax(1em, 1fr);
    }

    .page-layout {
        grid-template-areas: "article toc";
        grid-template-columns: minmax(0, 1fr) 15rem;
        gap: 3rem;
    }

    .page-toc {
        position: sticky;
        top: 1.5rem;
        max-height: calc(100vh - 3rem);
    }
}

body.slide-mode .page-toc {
    display: none;
}

/* Keep the theme control available without reserving space above a slide. */
body.slide-mode .page-tools {
    position: fixed;
    right: 1rem;
    bottom: 1rem;
    z-index: 10;
    margin: 0;
}

body.slide-mode .page-layout {
    grid-template-areas: "article";
    grid-template-columns: minmax(0, 1fr);
    margin-top: 0;
}

.wrap {
    flex-wrap: wrap;
}

.layout-spread-row {
    display: flex;
    justify-content: space-evenly;
}

pre {
  width: 100%;
  overflow: scroll;
  white-space:pre-wrap;
  word-wrap:break-word;
  overflow:auto;
}

a {
  text-decoration: none;
  background-image: linear-gradient(currentColor, currentColor);
  background-position: 0% 100%;
  background-repeat: no-repeat;
  background-size: 0% 4px;
  transition: background-size cubic-bezier(0,.5,0,1) 0.3s;
}

a:hover,
a:focus {
  text-decoration: none;
  background-size: 100% 2px;
}

img {
    width: 100%;
    height: auto;
}

/*  taken from github */
.mycode {
    padding: .2em .4em;
    margin: 0;
    font-size: 85%;
    background-color: var(--inline-code-bg);
    border-radius: 6px;
}

/* text that is super large and bold like a h2 */
.lead {
    font-size: 1.25rem;
    font-weight: 600;
    line-height: 1.4;
    margin-block: 1em 0.5em;
}
.api-box {
    background: var(--api-bg);
    padding: 1em;
    border-radius: 4px;
    border: 1px solid var(--border);
    margin-bottom: 1em;
}

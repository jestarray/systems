# Project guide

## Scope and reference material

This project is **Computer Systems**, a Pollen site of lessons for a YouTube series about computer systems, Boolean logic, binary arithmetic, and nand2tetris. Work on the book in this repository's root.

`pollen-tfl/` is a separate, complete Pollen book supplied as a learning reference. Consult its source for Pollen techniques; leave it unchanged unless the user explicitly requests changes there. Its dependencies, tags, metadata conventions, and design belong to that example, not automatically to this project.

Useful reference entry points are `pollen-tfl/README.md`, `pollen-tfl/template.html.p`, and `pollen-tfl/index.ptree`. Its `pollen.rkt` delegates most definitions to the documented implementation in `pollen-tfl/scribblings/pollen-rkt.scrbl`. Follow that file when studying its tag functions and decoding. Respect the reference book's reuse terms in its README, particularly for prose, images, and PDFs.

For language and command details, consult the [Pollen manual](https://docs.racket-lang.org/pollen/index.html) and [CLI reference](https://docs.racket-lang.org/pollen/raco-pollen.html).

## Project structure and sources

| Path | Purpose |
| --- | --- |
| `000_intro.html.pm` through `011_alu.html.pm` | Lesson sources, written in Pollen markup. |
| `index.ptree` | Hierarchical lesson order, used for navigation and the table of contents. |
| `index.html.pm` | Index source; calls `generate-toc` with the page tree. |
| `pollen.rkt` | Shared Racket functions, custom tags, decoding, and Pollen setup. |
| `template.html.p` | HTML shell, title, navigation, conditional highlighting assets, and slide mode link. |
| `styles.css.pp` | Pollen preprocessor source for the site's main stylesheet. |
| `slide_mode.js` | Presentation behavior for lesson slides. |
| `theme.js` | System theme detection, the dark mode toggle, and the saved theme preference. |
| `prism_highlight.js`, `prism.css` | Syntax highlighting assets, including the project's nand2tetris HDL grammar. |
| `images/`, `media/` | Diagrams, illustrations, and downloadable material. |
| `drafts/`, `other/`, `c/`, `InconsistenCies.html.pm` | Drafts, supplementary material, and code examples outside the main lesson tree. |

Edit `.html.pm` sources and `styles.css.pp`, then render their `.html` and `.css` outputs. The root lesson HTML, `index.html`, and `styles.css` are tracked generated files; regenerate the affected outputs when the toolchain is available and review their diffs. A standalone HTML file without a matching Pollen source may be an authored asset, so check before treating it as generated.

The template currently loads `styles.css`; inspect the template before choosing which stylesheet to change. Keep existing URLs, numbered filenames, and case-sensitive asset paths stable unless the task requires changing them. Preserve unrelated work and untracked reference or draft files. Leave `compiled/`, ignored `nand2tetris_solutions/`, and archives alone during routine edits.

## Writing Pollen and Racket

- Lesson sources start with `#lang pollen`. The command character is `◊` (U+25CA). Preserve UTF-8 encoding, mathematical symbols, and box-drawing characters.
- Use Pollen markup for prose and tags: `◊strong{important}`, `◊a[#:href "/index.html"]{Index}`, and `◊img[#:src "/images/and_gate.svg"]{}`. Embedded Racket expressions use `◊(...)`; definitions and imports can appear in a source file.
- This is Pollen markup, not Markdown. Use explicit list tags such as `◊ul{◊li{First item}◊li{Second item}}` when creating lists.
- Exports from the root `pollen.rkt` are automatically available to this project's Pollen sources. Its `(provide (all-defined-out))` exports new top-level definitions too; choose helper names carefully. Reuse existing helpers before adding new ones, and keep one-page logic local when practical.
- Custom tags are Racket functions and can have different signatures from default HTML tags. Check their definitions before passing attributes or nested content. In particular, `h2` and `h3` each take a single string.
- Helpers produce tagged X-expressions with `txexpr`: a tag symbol, an attribute list, and a list of elements. Keep this structure intact rather than constructing HTML strings for ordinary markup.
- The `root` decoder adds paragraphs and smart quotes/dashes. It excludes `code`, `pre`, `a`, `table`, `figure`, and `figcaption`. Preserve those exclusions when changing decoding so code, links, and diagrams keep their literal content.

Useful project helpers:

| Helper | Behavior |
| --- | --- |
| `slide` | Wraps content in `<section class="slide">`. |
| `h2`, `h3` | Generate heading IDs and anchor links by lowercasing and replacing spaces with underscores. |
| `q`, `step`, `steps` | Collapsible question, initially open step, and ordered steps. `q` and `step` take the summary first. |
| `hdl-code-block`, `c-code-block`, `r1-liner` | Code markup with Prism language classes; block helpers accept optional `#:data-src`. |
| `table`, `table-headings`, `table-entries` | Build tables from Racket values; inspect signatures and nearby working calls. |
| `base`, `2^`, `deci->binary`, `deci->bin-table`, `max-unsigned-limit-table`, `max-signed-limit-table` | Numeric notation, conversion, and teaching tables. Verify bit width and signed interpretation when using them. |
| `yt`, `lead`, `layout-spread-row`, `img-row` | Video embeds, emphasized text, and layout. `yt` expects a video ID rather than a full URL. |

`code-problem` and `starter&solution` expect `starter/` and `solutions/` files that are absent from this checkout. Check their file dependencies before introducing calls to them.

## Lessons, navigation, and slides

- Keep explanations approachable and concrete, using worked examples, truth tables, diagrams, and questions consistent with nearby lessons. Check Boolean expressions, binary values, and HDL wiring for technical accuracy.
- Give each lesson one plain-text `h1`: the template uses it for the page title and navigation, and `generate-toc` requires it. The table of contents also extracts `h2` headings from each lesson's `doc`.
- Preserve the parent/child structure in `index.ptree` when adding or moving lessons. Use output names such as `005_multibit.html` there. `generate-toc` expects grouped sections and dynamically loads the corresponding `.html.pm` sources, so a broken lesson can break the index too.
- Heading wording determines fragment URLs. Check the index and incoming links after changing `h2` or `h3` text.
- Slides coexist with reading-mode prose. Place content intended for presentation inside top-level `◊slide{...}` blocks; slide mode hides other direct children of `<article>`. Preserve this boundary when restructuring a lesson.
- Code highlighting is loaded by the template when the document contains a `code` tag. Keep helper language classes consistent with the bundled Prism grammar, especially `language-nand2tetris-hdl`.

## Build and preview

Run commands from the repository root with Racket and the Pollen package available on `PATH`. The root project imports Pollen and `txexpr`; the reference book's additional packages are not required for routine root-project work. Use `raco pollen version` to check availability. If the tools are missing, report that limitation instead of claiming a successful render.

| Task | Command |
| --- | --- |
| Preview locally | `raco pollen start` |
| Render a lesson and refresh the index | `raco pollen render 005_multibit.html index.html` |
| Render the main stylesheet | `raco pollen render styles.css` |
| Render the book | `raco pollen render` followed by `raco pollen render index.html` |
| Reset caches after a Racket update or stale-cache problem | `raco pollen reset` |
| Export a rendered site for distribution | `raco pollen publish` |

The setup in `pollen.rkt` sets the preview port to **1111**. Visit `http://localhost:1111/index.html` through the server so root-relative assets resolve correctly. `render.sh` runs the two full-book render commands above; on PowerShell, run the `raco` commands directly or use a working Bash environment.

Always render `index.html` explicitly after a full build: it is not listed in `index.ptree`, and `README.md` calls out this requirement. Root rendering does not need recursive switches; avoid expanding routine builds into the reference book or draft directories. For changes to shared helpers, templates, or navigation, render the whole root book.

Publishing copies the already-rendered project to the configured `../publish` directory and replaces that destination. Use it when distribution is requested, after rendering; it is separate from previewing or validating a change. `clean_temp_html.sh` deletes root HTML files with matching `.html.pm` sources, including tracked outputs, so it is unnecessary for normal rendering.

## Verification

There is no project-specific automated test suite configured. Match verification to the change:

- For lesson edits, render the affected lesson and index; inspect the resulting text, heading anchors, table of contents, and previous/next links.
- For shared Racket, template, or styling changes, render the root book and inspect representative pages with tables, code blocks, images, and questions. Check narrow screens when layout changes.
- For slide changes, check both reading and slide mode. Slide navigation uses A/D or the arrow keys; F2 exits slide mode.
- For arithmetic or conversion helper changes, check representative zero, positive, negative, and bit-width boundary cases where supported, in addition to rendering their callers.
- Finish by reviewing `git diff --check` and the changed-file list. Keep generated diffs relevant and report which checks ran and any checks the environment prevented.

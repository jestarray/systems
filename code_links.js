// Enhance Prism hash links with previews that leave the URL and scroll alone.
(() => {
    const plugin = window.Prism?.plugins.lineHighlight;
    if (!plugin) return;
    const links = Array.from(document.querySelectorAll('a[href^="#"]')).flatMap(link => {
        const match = /^#(.+)\.([\d,-]+)$/.exec(link.getAttribute('href'));
        const block = match && document.getElementById(match[1]);
        return block?.tagName === 'PRE' && block.querySelector('code')
            ? [{ link, block, ranges: match[2].split(',') }] : [];
    });
    if (!links.length) return;
    // Older click-only links may have left a persistent Prism highlight in the URL.
    const hash = /^#(.+)\.([\d,-]+)$/.exec(location.hash);
    const oldTarget = hash && links.find(({ block }) => block.id === hash[1]);
    if (oldTarget) {
        history.replaceState(history.state, '', location.pathname + location.search);
        oldTarget.block.querySelectorAll('.temporary.line-highlight').forEach(overlay => overlay.remove());
    }
    const previews = new Set();

    function refresh() {
        // Prism may have reused a preview for a native URL-hash highlight.
        previews.forEach(overlay => {
            if (overlay.classList.contains('code-link-highlight')) overlay.remove();
        });
        previews.clear();
        for (const { link, block, ranges } of links) {
            if (!link.matches(':hover, :focus-visible')) continue;
            if (!block.hasAttribute('data-line')) block.setAttribute('data-line', '');
            for (const range of ranges) {
                if (!/^\d+(?:-\d+)?$/.test(range)) continue;
                const selector = `.line-highlight[data-range="${range}"]`;
                if (block.querySelector(selector)) continue; // Preserve existing highlights.
                plugin.highlightLines(block, range, 'code-link-highlight')();
                const overlay = block.querySelector(selector);
                if (overlay) {
                    overlay.style.background = 'rgba(255, 196, 0, 0.22)';
                    previews.add(overlay);
                }
            }
        }
    }

    for (const { link } of links) {
        for (const event of ['mouseenter', 'mouseleave', 'focus', 'blur']) {
            link.addEventListener(event, refresh);
        }
        link.addEventListener('click', event => {
            if (event.button || event.ctrlKey || event.metaKey || event.shiftKey || event.altKey) return;
            event.preventDefault();
            link.focus({ preventScroll: true });
            refresh();
        });
    }
    window.addEventListener('resize', refresh);
    window.addEventListener('hashchange', () => requestAnimationFrame(refresh));
    document.fonts?.ready.then(refresh);
    window.Prism.hooks.add('complete', () => requestAnimationFrame(refresh));
})();

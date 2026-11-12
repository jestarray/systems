// Keep the reading view usable without JavaScript or native dialog support.
(() => {
    if (typeof HTMLDialogElement === "undefined" || typeof ResizeObserver === "undefined") return;
    const tables = document.querySelectorAll("article .table-scroll");
    if (!tables.length) return;

    const dialog = document.createElement("dialog");
    dialog.className = "table-dialog";
    dialog.innerHTML = '<form method="dialog"><button autofocus>Close</button></form><div class="table-scroll" tabindex="0"></div>';
    const viewport = dialog.querySelector(".table-scroll");
    document.body.append(dialog);
    let active = null;

    dialog.addEventListener("close", () => {
        const { scroll, button, table, pageX, pageY } = active;
        scroll.append(table);
        scroll.style.height = "";
        active = null;
        button.focus({ preventScroll: true });
        window.scrollTo({ left: pageX, top: pageY, behavior: "instant" });
    });
    // Arrow keys scroll the expanded table without advancing lesson slides.
    dialog.addEventListener("keydown", event => event.stopPropagation());
    dialog.addEventListener("click", event => {
        const bounds = dialog.getBoundingClientRect();
        if (event.target === dialog && (event.clientX < bounds.left || event.clientX > bounds.right ||
            event.clientY < bounds.top || event.clientY > bounds.bottom)) dialog.close();
    });

    tables.forEach(scroll => {
        const table = scroll.querySelector("table");
        const button = document.createElement("button");
        button.type = "button";
        button.className = "table-expand";
        button.textContent = "Popout Table";
        button.setAttribute("aria-haspopup", "dialog");
        button.hidden = true;
        scroll.before(button);
        button.addEventListener("click", () => {
            const pageX = window.scrollX;
            const pageY = window.scrollY;
            active = { scroll, button, table, pageX, pageY };
            // Preserve the reading position while moving the original table.
            scroll.style.height = `${scroll.getBoundingClientRect().height}px`;
            dialog.setAttribute("aria-label", scroll.getAttribute("aria-label") || "Expanded table");
            viewport.replaceChildren(table);
            dialog.showModal();
            // Native dialog autofocus can scroll the document in some browsers.
            window.scrollTo({ left: pageX, top: pageY, behavior: "instant" });
        });
        const observer = new ResizeObserver(() => {
            if (active?.scroll !== scroll) {
                button.hidden = scroll.scrollWidth <= scroll.clientWidth;
            }
        });
        observer.observe(scroll);
        observer.observe(table);
    });
})();

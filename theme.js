(() => {
    const storageKey = "computer-systems-theme";
    const root = document.documentElement;
    const systemTheme = window.matchMedia("(prefers-color-scheme: dark)");
    let preference = null;

    try {
        const saved = localStorage.getItem(storageKey);
        if (saved === "light" || saved === "dark") {
            preference = saved;
        }
    } catch {
        // The toggle still works when browser storage is unavailable.
    }

    function applyTheme(theme) {
        root.dataset.theme = theme;
        const toggle = document.getElementById("theme-toggle");
        if (toggle) {
            toggle.setAttribute("aria-pressed", String(theme === "dark"));
            toggle.title = theme === "dark" ? "Switch to light mode" : "Switch to dark mode";
        }
    }

    // Apply the preference before the stylesheet loads to avoid a light flash.
    applyTheme(preference || (systemTheme.matches ? "dark" : "light"));

    document.addEventListener("DOMContentLoaded", () => {
        const toggle = document.getElementById("theme-toggle");
        if (!toggle) {
            return;
        }
        applyTheme(root.dataset.theme);
        toggle.hidden = false;
        toggle.addEventListener("click", () => {
            preference = root.dataset.theme === "dark" ? "light" : "dark";
            applyTheme(preference);
            try {
                localStorage.setItem(storageKey, preference);
            } catch {
                // Keep the current page usable without persisting the choice.
            }
        });
    });

    systemTheme.addEventListener("change", () => {
        if (preference === null) {
            applyTheme(systemTheme.matches ? "dark" : "light");
        }
    });
})();

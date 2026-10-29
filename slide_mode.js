// Slides inherit the page theme unless explicit colors are supplied.
function slide_mode(bg_color, color) {
    //if there isnt enough content for a slide and it looks to small, just zoom in! it also helps emphasizes the point
    let body = document.getElementsByTagName("body")[0];
    if (bg_color != undefined) {
        body.style.background = bg_color;
    }
    if (color != undefined) {
        body.style.color = color;
    }
    let all = document.getElementsByTagName("article")[0].children;
    Array.from(all).forEach((v) => {
        if (!v.classList.contains("slide")) {
            v.style.display = "none";
        }
    });

    let nav = document.getElementsByTagName("nav")[0];
    nav.style.display = "none";

    let slide_points = Array.from(document.querySelectorAll(".slide"));
    slide_points.forEach((v) => {
        v.classList.add("slide-container");
    });
    let index = 0;

    function show_rev() {
        slide_points.forEach((v, index2) => {
            if (index2 !== index) {
                v.style.display = "none";
            } else {
                v.style.display = "";
            }
        });
    }
    show_rev(); //initialize the slideshow by hiding everything
    function handleSlideKeydown(ev) {
        const key_pressed = ev.key;
        if (key_pressed.toLowerCase() === "a" || key_pressed === "ArrowLeft") {
            if (!(index - 1 < 0)) {
                index -= 1;
            }
        } else if (key_pressed.toLowerCase() === "d" || key_pressed === "ArrowRight") {
            if (index + 1 < slide_points.length) {
                index += 1;
            }
        } else if (key_pressed === "F2") {
            // using f2 instead of escape because you might just want to escape fullscreen mode but not slide mode
            window.removeEventListener("keydown", handleSlideKeydown);
            disable_slide_mode();
            return;
        }
        show_rev();

    }
    window.addEventListener("keydown", handleSlideKeydown);
}

function disable_slide_mode() {
    let all = document.getElementsByTagName("article")[0].children;
    Array.from(all).forEach((v) => {
        v.style.display = "";
    });

    let nav = document.getElementsByTagName("nav")[0];
    nav.style.display = "";

    let slide_points = Array.from(document.querySelectorAll(".slide"));
    slide_points.forEach((v) => {
        v.classList.remove("slide-container");
    });
}

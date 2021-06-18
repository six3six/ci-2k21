const hamburger = document.querySelector("nav #hamburger")
const nav = document.querySelector("nav #mobile-menu")

hamburger.addEventListener("click", clickHamburger);

function clickHamburger() {
    nav.classList.toggle("open")
}
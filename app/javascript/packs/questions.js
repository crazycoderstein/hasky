window.addEventListener("load", () => {
    const hot = document.getElementById("hotT");
    hot.addEventListener("mouseover", makeHot);
    hot.addEventListener("mouseout", makeNorm)
})

function makeHot (event) {
    let targ = event.target;
    targ.style.fontSize = "40px";
    targ.style.color = "red";
}

function makeNorm(event) {
    let targ = event.target;
    targ.style.fontSize = "25px";
    targ.style.color = "black";
}

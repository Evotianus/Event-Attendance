let heading = document.querySelector("h2.heading");
let detail = document.querySelector(".detail");

let title = localStorage.getItem("title");
let content = localStorage.getItem("content");

heading.innerHTML = title;
detail.innerHTML = content;
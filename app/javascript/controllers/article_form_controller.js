import { Controller } from "@hotwired/stimulus";

const toolbarOptions = [
  ["bold", "italic", "underline", "strike"], // toggled buttons
  [{ font: [] }],
  [{ header: [1, 2, 3, 4, 5, 6, false] }],
  [{ color: [] }, { background: [] }], // dropdown with defaults from theme
  ["link", "image", "video"],

  [{ list: "ordered" }, { list: "bullet" }, { list: "check" }],
  [{ indent: "+1" }], // outdent/indent
  [{ direction: "rtl" }], // text direction

  [{ align: [] }],

  ["code-block"],
];

const quilOptions = {
  modules: {
    syntax: true,
    toolbar: toolbarOptions,
  },
  theme: "snow",
};

// Connects to data-controller="article-form"
export default class extends Controller {
  quill;

  connect() {
    this.quill = new Quill("#editor", quilOptions);
  }

  submit_form(event) {
    event.preventDefault();

    const html = this.quill.getSemanticHTML();
    const formElement = document.getElementById("article-form");

    const bodyElement = document.getElementsByName("article[body]")[0];
    bodyElement.value = html
    console.log({ value: bodyElement.value })

    formElement.submit();
  }
}

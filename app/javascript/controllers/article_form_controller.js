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
  debug: "info",
  syntax: true,
  modules: {
    toolbar: toolbarOptions,
  },
  placeholder: "Compose an epic...",
  theme: "snow",
};

// Connects to data-controller="article-form"
export default class extends Controller {
  quill;

  connect() {
    const rootElement = this.element;

    this.quill = new Quill("#editor", quilOptions);
    this.quill.on("editor-change", (eventName, ...args) => {
      console.log("From Penayo", { eventName, args });
    });

    this.quill.on("text-change", function (delta, oldDelta, source, ...args) {
      if (source === "user") {
        // Check if the change is made by user input
        // Check if the change includes a new code block
        delta.ops.forEach((op) => {
          if (op.attributes && op.attributes["code-block"]) {
            console.log("A code block has been added!", op.attributes);
            op.attributes["code-block"] = "javascript";
            rootElement
              .querySelectorAll("div.ql-code-block")
              .forEach((block) => {
                console.log("CODE BLOCK", block, window.hljs.listLanguages());
                hljs.highlightAuto(block, { language: "ruby" });
              });

            // Handle anything you need to do when a code-block is detected
          }
        });
      }
    });
  }

  submit_form(event) {
    event.preventDefault();
    const html = this.quill.root.innerHTML;
    const formElement = document.getElementById("article-form");

    const bodyElement = document.getElementsByName("article[body]")[0];
    console.log(bodyElement);

    bodyElement.value = html;

    formElement.submit();
  }
}

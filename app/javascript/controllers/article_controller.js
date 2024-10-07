import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="article"
export default class extends Controller {
  connect() {
    this.element
      .querySelectorAll('pre[data-language]')
      .forEach((block) => {
        hljs.highlightElement(block, { language: block.dataset.language });
      });
  }
}

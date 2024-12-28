import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment"
export default class extends Controller {
  connect() {
  }

  submit (e) {
    e.preventDefault()
    e.target.form.requestSubmit()
  }
}

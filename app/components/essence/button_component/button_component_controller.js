import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const button = this.element
    const formId = button.getAttribute("form")

    this.form = formId
      ? document.getElementById(formId)
      : button.closest("form")

    if (!this.form) return

    this._start = () => button.classList.add("button-busy")
    this._end   = () => button.classList.remove("button-busy")

    this.form.addEventListener("turbo:submit-start", this._start)
    this.form.addEventListener("turbo:submit-end", this._end)
  }

  disconnect() {
    if (!this.form) return

    this.form.removeEventListener("turbo:submit-start", this._start)
    this.form.removeEventListener("turbo:submit-end", this._end)
  }
}

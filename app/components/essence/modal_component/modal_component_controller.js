import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modalContent"]

  hideModal() {
    const frame = this.element.closest("turbo-frame")
    if (frame) frame.removeAttribute("src")
    this.element.remove()
  }

  closeWithKeyboard(e) {
    if (e.key === "Escape") this.hideModal()
  }

  closeBackground(e) {
    if (!this.modalContentTarget.contains(e.target)) this.hideModal()
  }

  submitEnd(e) {
    if (e.detail.success) this.hideModal()
  }
}

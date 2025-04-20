import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const flash = this.element

    if (flash.classList.contains("flash-success") ||
        flash.classList.contains("flash-notice") ||
        flash.classList.contains("flash-info")) {
      setTimeout(() => {
        this.dismiss()
      }, 3300);
    }
  }

  dismiss() {
    const flash = this.element

    flash.classList.add("flash-hide")
    setTimeout(() => {
      flash.remove()
    }, 1300)
  }
}

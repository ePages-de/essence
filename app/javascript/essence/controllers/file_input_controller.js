import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="file-input"
export default class extends Controller {
  static values = {
    buttonText: String,
    changeFileText: String
  }

  static targets = [
    "button",
    "fileName",
    "input"
  ]

  change() {
    this.#updateFileName()
    this.#updateButtonText()
  }

  #updateFileName() {
    const files     = this.inputTarget.files
    let displayText = this.noFileSelectedTextValue

    if (files.length === 1) {
      displayText = files[0].name
    } else if (files.length > 1) {
      displayText = `${files.length} files selected`
    }

    this.fileNameTarget.textContent = displayText;
  }

  #updateButtonText() {
    if (this.inputTarget.files.length > 0) {
      this.buttonTarget.textContent = this.changeFileTextValue;
    } else {
      this.buttonTarget.textContent = this.buttonTextValue;
    }
  }
}

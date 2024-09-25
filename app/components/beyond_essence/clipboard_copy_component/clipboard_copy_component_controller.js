import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "input",
    "link"
  ]

  static values = {
    confirmationText: String
  }

  ClipboardCopy() {
    const linkTextSelector = this.linkTarget.querySelector("span"),
          previousLinkText = linkTextSelector.textContent,
          textToCopy       = this.inputTarget.value

    navigator.clipboard.writeText(textToCopy);
    linkTextSelector.textContent = this.confirmationTextValue;

    setTimeout(() => {
      linkTextSelector.textContent = previousLinkText;
    }, 1000);
  }
}

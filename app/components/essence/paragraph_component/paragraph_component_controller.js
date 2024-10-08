import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    externalIcon: String
  }

  connect() {
    const externalLinks = this.element.querySelectorAll('a[target="_blank"]')

    externalLinks.forEach(link => {
      link.insertAdjacentHTML('beforeend', this.#externalLinkIcon())
    })
  }

  #externalLinkIcon() {
    return this.externalIconValue
  }
}

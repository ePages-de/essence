import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static outlets = [
    "expand-all-button"
  ]

  static values = {
    expanded: Boolean
  }

  toggle() {
    this.#updateExpandedState(!this.expandedValue)
  }

  expand() {
    this.#updateExpandedState(true)
  }

  collapse() {
    this.#updateExpandedState(false)
  }

  #updateExpandedState(expandedState) {
    this.expandedValue = expandedState
    this.#triggerOutletsCheckExpandables()
  }

  #triggerOutletsCheckExpandables() {
    this.expandAllButtonOutlets.forEach(expandable => expandable.checkExpandables())
  }
}

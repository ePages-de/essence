import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static outlets = [
    "expandable"
  ]

  static values = {
    expandAllText: String,
    collapseAllText: String,
    allExpanded: Boolean
  }

  connect() {
    this.checkExpandables()
  }

  toggleAll() {
    this.#updateExpandablesState(!this.allExpandedValue)
  }

  collapseAll() {
    this.#updateExpandablesState(false)
  }

  expandAll() {
    this.#updateExpandablesState(true)
  }

  checkExpandables() {
    if (this.expandableOutlets.length === 0) return

    const allExpanded = this.expandableOutlets.every(expandable => expandable.expandedValue)
    const allCollapsed = this.expandableOutlets.every(expandable => !expandable.expandedValue)

    if (allExpanded) {
      this.#updateExpandedState(true)
    } else if (allCollapsed) {
      this.#updateExpandedState(false)
    }
  }

  #updateExpandablesState(expandedState) {
    this.#updateExpandedState(expandedState)
    this.expandableOutlets.forEach(expandable => expandedState ? expandable.expand() : expandable.collapse())
  }

  #updateExpandedState(expandedState) {
    this.allExpandedValue = expandedState
    this.element.querySelector("span").textContent = expandedState ? this.collapseAllTextValue : this.expandAllTextValue
  }
}

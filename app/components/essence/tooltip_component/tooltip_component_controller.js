import { Controller } from "@hotwired/stimulus"
import { computePosition, arrow, offset, flip, autoUpdate } from "@floating-ui/dom"

// Connects to data-controller="tooltip"
export default class extends Controller {
  static targets = [
    "icon",
    "bubble",
    "arrow",
  ]

  connect() {
    this.cleanup = autoUpdate(this.iconTarget, this.bubbleTarget, () => {
      this.#updatePosition()
    });
  }

  disconnect() {
    if (this.cleanup) {
      this.cleanup()
    }
  }

  #updatePosition() {
    computePosition(this.iconTarget, this.bubbleTarget, {
      placement: 'right',
      middleware: [
        flip({
          fallbackPlacements: ['left', 'bottom', 'top'],
        }),
        arrow({ element: this.arrowTarget }),
        offset(10)
      ],
    }).then(({ x, y, placement, middlewareData }) => {
      Object.assign(this.bubbleTarget.style, {
        left: `${x}px`,
        top: `${y}px`
      })

      const side = placement.split("-")[0]

      const staticSide = {
        left: "right",
        top: "bottom",
        right: "left",
        bottom: "top",
      }[side]

      if (middlewareData.arrow) {
        const { x, y } = middlewareData.arrow
        Object.assign(this.arrowTarget.style, {
          left: x != null ? `${x}px` : "",
          top: y != null ? `${y}px` : "",
          [staticSide]: `${-this.arrowTarget.offsetWidth / 2}px`,
          transform: "rotate(45deg)"
        })
      }
    })
  }
}

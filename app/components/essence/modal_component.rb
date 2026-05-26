# frozen_string_literal: true

module Essence
  class ModalComponent < ApplicationComponent
    attr_reader :title, :footer_alignment, :title_id, :dismiss_icon, :html_options

    FOOTER_ALIGNMENT_OPTIONS = ['start', 'center', 'end', 'space-between'].freeze
    DEFAULT_FOOTER_ALIGNMENT = 'end'

    renders_one :footer

    def initialize(title:,
                   dismiss_icon: false,
                   dismiss_keyup: false,
                   dismiss_click: false,
                   dismiss_submit: false,
                   footer_alignment: DEFAULT_FOOTER_ALIGNMENT,
                   **html_options)
      @title            = title
      @dismiss_icon     = dismiss_icon
      @dismiss_keyup    = dismiss_keyup
      @dismiss_click    = dismiss_click
      @dismiss_submit   = dismiss_submit
      @footer_alignment = fetch_or_fallback(FOOTER_ALIGNMENT_OPTIONS, footer_alignment, DEFAULT_FOOTER_ALIGNMENT)
      @title_id         = "modal-title-#{object_id}"
      @html_options     = html_options
    end

    private

    def before_render
      set_base_html_options(
        'modal',
        role: 'dialog',
        aria: { modal: 'true', labelledby: title_id },
        data: { controller: 'modal', action: modal_actions }.compact
      )
    end

    def modal_actions
      actions = []
      actions << 'keyup@window->modal#closeWithKeyboard' if @dismiss_keyup
      actions << 'click@window->modal#closeBackground'  if @dismiss_click
      actions << 'turbo:submit-end->modal#submitEnd'    if @dismiss_submit
      actions.join(' ').presence
    end
  end
end

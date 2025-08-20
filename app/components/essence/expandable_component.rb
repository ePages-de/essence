# frozen_string_literal: true

module Essence
  class ExpandableComponent < ApplicationComponent
    attr_reader :name, :html_options

    DEFAULT_EXPANDED = false

    def initialize(name:,
                   expanded: DEFAULT_EXPANDED,
                   **html_options)
      @name         = name
      @expanded     = fetch_or_fallback_boolean(expanded, fallback: DEFAULT_EXPANDED)
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options(
        'expandable',
        data: {
          controller: 'expandable',
          expandable_expanded_value: @expanded,
          expandable_expand_all_button_outlet: '.expandable-toggle'
        }
      )
    end
  end
end

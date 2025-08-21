# frozen_string_literal: true

module Essence
  class ExpandableToggleComponent < ApplicationComponent
    attr_reader :expand_all_text, :html_options

    DEFAULT_TARGET = '.expandable'

    def initialize(target: DEFAULT_TARGET,
                   expand_all_text: nil,
                   collapse_all_text: nil,
                   **html_options)
      @target            = target
      @expand_all_text   = expand_all_text
      @collapse_all_text = collapse_all_text
      @html_options      = html_options
    end

    private

    def before_render
      @expand_all_text   ||= t('.expand_all_text')
      @collapse_all_text ||= t('.collapse_all_text')

      set_base_html_options(
        'expandable-toggle',
        data: {
          controller: 'expandable-toggle',
          action: 'expandable-toggle#toggleAll',
          expandable_toggle_expandable_outlet: @target,
          expandable_toggle_expand_all_text_value: @expand_all_text,
          expandable_toggle_collapse_all_text_value: @collapse_all_text,
          expandable_toggle_all_expanded_value: false
        }
      )
    end
  end
end

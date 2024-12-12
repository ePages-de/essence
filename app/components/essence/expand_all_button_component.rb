# frozen_string_literal: true

module Essence
  class ExpandAllButtonComponent < ApplicationComponent
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
        'expand-all-button',
        data: {
          controller: 'expand-all-button',
          action: 'expand-all-button#toggleAll',
          expand_all_button_expandable_outlet: @target,
          expand_all_button_expand_all_text_value: @expand_all_text,
          expand_all_button_collapse_all_text_value: @collapse_all_text,
          expand_all_button_all_expanded_value: false
        }
      )
    end
  end
end

# frozen_string_literal: true

module Essence
  class ClipboardCopyComponent < ApplicationComponent
    attr_reader :input_name, :input_label, :input_value, :link_text, :html_options

    def initialize(input_name:,
                   input_label: nil,
                   input_value: nil,
                   link_text: nil,
                   link_confirmation_text: nil,
                   **html_options)
      @input_name             = input_name
      @input_label            = input_label || false
      @input_value            = input_value
      @link_text              = link_text
      @link_confirmation_text = link_confirmation_text
      @html_options           = html_options
    end

    private

    def before_render
      @link_text              ||= t('.link_text')
      @link_confirmation_text ||= t('.link_confirmation_text')

      set_base_html_options(
        'clipboard-copy',
        data: {
          controller: 'clipboard-copy',
          clipboard_copy_confirmation_text_value: html_escape(@link_confirmation_text)
        }
      )
    end
  end
end

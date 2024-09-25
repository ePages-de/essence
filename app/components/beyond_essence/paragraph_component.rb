# frozen_string_literal: true

module BeyondEssence
  class ParagraphComponent < ApplicationComponent
    attr_reader :html_options

    def initialize(**html_options)
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options
    end

    def set_base_html_options
      base_html_options = {
        class: class_names(
          'paragraph'
        ),
        data: {
          controller: 'paragraph',
          paragraph_external_icon_value: html_escape(render(IconComponent.new(name: 'arrow_up_right_from_square'))).strip
        }
      }

      @html_options = merge_options(base_html_options, @html_options)
    end
  end
end

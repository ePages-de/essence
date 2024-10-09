# frozen_string_literal: true

module Essence
  class ParagraphComponent < ApplicationComponent
    attr_reader :html_options

    def initialize(**html_options)
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options(
        'paragraph',
        data: {
          controller: 'paragraph',
          paragraph_external_icon_value:
        }
      )
    end

    def paragraph_external_icon_value
      html_escape(render(IconComponent.new(name: 'arrow_up_right_from_square'))).strip
    end
  end
end

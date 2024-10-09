# frozen_string_literal: true

module Essence
  class TooltipComponent < ApplicationComponent
    attr_reader :text, :html_options

    def initialize(text:, **html_options)
      @text         = text
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options
    end

    def set_base_html_options
      base_html_options = {
        class: class_names(
          'tooltip'
        ),
        data: {
          controller: 'tooltip'
        }
      }

      @html_options = merge_options(base_html_options, @html_options)
    end
  end
end

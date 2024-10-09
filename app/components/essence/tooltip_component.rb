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
      set_base_html_options(
        'tooltip',
        data: {
          controller: 'tooltip'
        }
      )
    end
  end
end

# frozen_string_literal: true

module Essence
  class SpinnerComponent < ApplicationComponent
    attr_reader :html_options

    def initialize(size: 40,
                   **html_options)
      @size         = integer_or_fallback(size, 40)
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options('spinner', style: "--spinner-size: #{@size}px;")
    end
  end
end

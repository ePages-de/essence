# frozen_string_literal: true

module BeyondEssence
  class SpinnerComponent < ApplicationComponent
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
          'spinner'
        )
      }

      @html_options = merge_options(base_html_options, @html_options)
    end
  end
end

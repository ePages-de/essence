# frozen_string_literal: true

module Essence
  class SpinnerComponent < ApplicationComponent
    attr_reader :html_options

    def initialize(**html_options)
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options('spinner')
    end
  end
end

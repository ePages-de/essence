# frozen_string_literal: true

module Essence
  class ButtonGroupComponent < ApplicationComponent
    attr_reader :html_options

    renders_many :buttons, ButtonComponent

    def initialize(**html_options)
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options('button-group')
    end
  end
end

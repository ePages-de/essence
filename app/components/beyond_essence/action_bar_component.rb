# frozen_string_literal: true

module BeyondEssence
  class ActionBarComponent < ApplicationComponent
    attr_reader :html_options

    [:left, :right].each do |side|
      renders_many side, types: {
        button: ButtonComponent,
        link: LinkComponent
      }
    end

    def initialize(**html_options)
      @html_options = html_options
    end

    alias left_components left
    alias right_components right

    private

    def before_render
      set_base_html_options
    end

    def set_base_html_options
      base_html_options = {
        class: class_names(
          'action-bar'
        )
      }

      @html_options = merge_options(base_html_options, @html_options)
    end
  end
end

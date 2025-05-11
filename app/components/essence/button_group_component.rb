# frozen_string_literal: true

module Essence
  class ButtonGroupComponent < ApplicationComponent
    attr_reader :html_options

    renders_many :group, types: {
      button: lambda { |**args|
        ButtonComponent.new(size: 16, **args.merge(display_as: :button))
      },
      link: lambda { |**args|
        LinkComponent.new(size: 16, **args.merge(display_as: :button))
      }
    }

    def initialize(**html_options)
      @html_options = html_options
    end

    alias button_group_elements group

    private

    def before_render
      set_base_html_options('button-group')
    end
  end
end

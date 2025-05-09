# frozen_string_literal: true

module Essence
  class ButtonGroupComponentPreview < ViewComponent::Preview
    def default
      render(ButtonGroupComponent.new)
    end
  end
end

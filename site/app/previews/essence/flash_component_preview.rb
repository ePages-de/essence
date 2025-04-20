# frozen_string_literal: true

module Essence
  class FlashComponentPreview < ViewComponent::Preview
    def default
      render(FlashComponent.new)
    end
  end
end

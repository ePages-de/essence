# frozen_string_literal: true

module BeyondEssence
  #
  # @logical_path components
  #
  class TooltipComponentPreview < ViewComponent::Preview
    #
    # @param text
    #
    def default(text: 'Tootip text')
      render BeyondEssence::TooltipComponent.new(text:)
    end
  end
end

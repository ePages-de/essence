# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  class TooltipComponentPreview < ViewComponent::Preview
    #
    # @param text
    #
    def default(text: 'Tootip text')
      render Essence::TooltipComponent.new(text:)
    end
  end
end

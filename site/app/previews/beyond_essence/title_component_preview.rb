# frozen_string_literal: true

module BeyondEssence
  #
  # @logical_path components
  #
  # @display wrapper background
  #
  class TitleComponentPreview < ViewComponent::Preview
    #
    # @param text
    #
    def default(text: 'Title text')
      render BeyondEssence::TitleComponent.new(text:)
    end
  end
end

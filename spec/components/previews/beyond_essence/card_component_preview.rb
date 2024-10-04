# frozen_string_literal: true

module BeyondEssence
  #
  # @logical_path components
  #
  # @display wrapper background
  #
  class CardComponentPreview < ViewComponent::Preview
    #
    # @param headline
    # @param text
    #
    def default(headline: 'Card headline',
                text: 'Card text')
      render BeyondEssence::CardComponent.new(headline:) do
        text
      end
    end
  end
end

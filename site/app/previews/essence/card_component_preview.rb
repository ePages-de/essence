# frozen_string_literal: true

module Essence
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
      render Essence::CardComponent.new(headline:) do
        text
      end
    end
  end
end

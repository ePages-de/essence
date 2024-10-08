# frozen_string_literal: true

module BeyondEssence
  #
  # @logical_path components
  #
  # @display wrapper card
  #
  class EmptyStateComponentPreview < ViewComponent::Preview
    #
    # @param headline
    # @param body
    # @param link_text
    #
    def default(image_path: 'lookbook/previews/beyond_essence/empty_state_component/image.svg',
                headline: 'Headline text',
                body: 'Body text',
                link_text: 'Button text',
                link_url: '#')
      render BeyondEssence::EmptyStateComponent.new(image_path:, headline:, body:, link_text:, link_url:)
    end
  end
end

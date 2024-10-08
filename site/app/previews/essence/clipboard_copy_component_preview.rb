# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  # @display wrapper card
  #
  class ClipboardCopyComponentPreview < ViewComponent::Preview
    #
    # @param input_name
    # @param input_label
    # @param input_value
    # @param link_text
    # @param link_confirmation_text
    #
    def default(input_name: :feed_url,
                input_label: 'Feed URL',
                input_value: 'https://example.com/feed.csv',
                link_text: 'Copy',
                link_confirmation_text: 'Copied!')
      render Essence::ClipboardCopyComponent.new(input_name:, input_label:, input_value:, link_text:,
                                                       link_confirmation_text:)
    end
  end
end

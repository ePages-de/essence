# frozen_string_literal: true

module Essence
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
      render Essence::TitleComponent.new(text:)
    end
  end
end

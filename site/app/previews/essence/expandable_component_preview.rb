# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  class ExpandableComponentPreview < ViewComponent::Preview
    #
    # @param name
    # @param text
    #
    def default(name: 'Expandable name',
                text: 'Expandable text')
      render Essence::ExpandableComponent.new(name:) do
        text
      end
    end
  end
end

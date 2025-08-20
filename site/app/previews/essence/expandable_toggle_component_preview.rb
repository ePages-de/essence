# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  class ExpandableToggleComponentPreview < ViewComponent::Preview
    #
    # @param expand_all_text
    # @param collapse_all_text
    # @param target
    #
    def default(collapse_all_text: 'Collapse all',
                expand_all_text: 'Expand all',
                target: '.expandable-target')
      render Essence::ExpandableToggleComponent.new(target:, expand_all_text:, collapse_all_text:)
    end
  end
end

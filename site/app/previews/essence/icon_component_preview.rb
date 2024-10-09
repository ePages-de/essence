# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  class IconComponentPreview < ViewComponent::Preview
    #
    # @param name select {{ Essence::IconComponent::NAME_OPTIONS }}
    #
    def default(name: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::IconComponent.new(name:)
    end
  end
end

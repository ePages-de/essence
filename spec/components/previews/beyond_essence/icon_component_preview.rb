# frozen_string_literal: true

module BeyondEssence
  #
  # @logical_path components
  #
  class IconComponentPreview < ViewComponent::Preview
    #
    # @param name select {{ BeyondEssence::IconComponent::NAME_OPTIONS }}
    #
    def default(name: BeyondEssence::IconComponent::NAME_OPTIONS.first)
      render BeyondEssence::IconComponent.new(name:)
    end
  end
end

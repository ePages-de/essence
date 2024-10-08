# frozen_string_literal: true

module BeyondEssence
  #
  # @hidden
  #
  # @logical_path components
  #
  class BreadcrumbComponentPreview < ViewComponent::Preview
    #
    # @display wrapper background
    #
    def default
      render BeyondEssence::BreadcrumbComponent.new
    end
  end
end

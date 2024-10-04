# frozen_string_literal: true

module BeyondEssence
  #
  # @logical_path components
  #
  class SpinnerComponentPreview < ViewComponent::Preview
    def default
      render BeyondEssence::SpinnerComponent.new
    end
  end
end

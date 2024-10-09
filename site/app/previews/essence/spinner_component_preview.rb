# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  class SpinnerComponentPreview < ViewComponent::Preview
    def default
      render Essence::SpinnerComponent.new
    end
  end
end

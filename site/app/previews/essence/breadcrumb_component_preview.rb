# frozen_string_literal: true

module Essence
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
      render Essence::BreadcrumbComponent.new
    end
  end
end

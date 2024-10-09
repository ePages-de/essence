# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  class NotificationComponentPreview < ViewComponent::Preview
    # @!group Variants

    #
    # @param text
    #
    # @label Info (default)
    #
    def info(text: 'Notification text')
      render Essence::NotificationComponent.new(variant: :info) do
        text
      end
    end

    #
    # @label Success
    #
    def success(text: 'Notification text')
      render Essence::NotificationComponent.new(variant: :success) do
        text
      end
    end

    #
    # @label Warning
    #
    def warning(text: 'Notification text')
      render Essence::NotificationComponent.new(variant: :warning) do
        text
      end
    end

    #
    # @label Danger
    #
    def danger(text: 'Notification text')
      render Essence::NotificationComponent.new(variant: :danger) do
        text
      end
    end

    # @!endgroup
  end
end

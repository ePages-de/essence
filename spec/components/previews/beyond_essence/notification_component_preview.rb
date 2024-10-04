# frozen_string_literal: true

module BeyondEssence
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
      render BeyondEssence::NotificationComponent.new(variant: :info) do
        text
      end
    end

    #
    # @label Success
    #
    def success(text: 'Notification text')
      render BeyondEssence::NotificationComponent.new(variant: :success) do
        text
      end
    end

    #
    # @label Warning
    #
    def warning(text: 'Notification text')
      render BeyondEssence::NotificationComponent.new(variant: :warning) do
        text
      end
    end

    #
    # @label Danger
    #
    def danger(text: 'Notification text')
      render BeyondEssence::NotificationComponent.new(variant: :danger) do
        text
      end
    end

    # @!endgroup
  end
end

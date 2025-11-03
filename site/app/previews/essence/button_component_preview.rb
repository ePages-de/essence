# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  class ButtonComponentPreview < ViewComponent::Preview
    # @!group Base

    #
    # @param name
    # @param disabled
    #
    # @label Primary (default)
    #
    def primary(name: 'Button text',
                url: nil,
                disabled: false)
      render Essence::ButtonComponent.new(name:, url:, variant: :primary, disabled:)
    end

    #
    # @label Secondary
    #
    def secondary(name: 'Button text',
                  url: nil,
                  disabled: false)
      render Essence::ButtonComponent.new(name:, url:, variant: :secondary, disabled:)
    end

    #
    # @label Danger
    #
    def danger(name: 'Button text',
               url: nil,
               disabled: false)
      render Essence::ButtonComponent.new(name:, url:, variant: :danger, disabled:)
    end

    #
    # @label Outline
    #
    def outline(name: 'Button text',
                url: nil,
                disabled: false)
      render Essence::ButtonComponent.new(name:, url:, variant: :outline, disabled:)
    end

    #
    # @label Copilot
    #
    def copilot(name: 'Button text',
                url: nil,
                disabled: false)
      render Essence::ButtonComponent.new(name:, url:, variant: :copilot, disabled:)
    end

    # @!endgroup

    # @!group With left icon

    #
    # @param name
    # @param left_icon select {{ Essence::IconComponent::NAME_OPTIONS }}
    # @param disabled
    #
    # @label Primary (default)
    #
    def primary_left_icon(name: 'Button text',
                          url: nil,
                          disabled: false,
                          left_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::ButtonComponent.new(name:, url:, variant: :primary, disabled:) do |button|
        button.with_left_icon left_icon
      end
    end

    #
    # @label Secondary
    #
    def secondary_left_icon(name: 'Button text',
                            url: nil,
                            disabled: false,
                            left_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::ButtonComponent.new(name:, url:, variant: :secondary, disabled:) do |button|
        button.with_left_icon left_icon
      end
    end

    #
    # @label Danger
    #
    def danger_left_icon(name: 'Button text',
                         url: nil,
                         disabled: false,
                         left_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::ButtonComponent.new(name:, url:, variant: :danger, disabled:) do |button|
        button.with_left_icon left_icon
      end
    end

    #
    # @label Outline
    #
    def outline_left_icon(name: 'Button text',
                          url: nil,
                          disabled: false,
                          left_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::ButtonComponent.new(name:, url:, variant: :outline, disabled:) do |button|
        button.with_left_icon left_icon
      end
    end

    # @!endgroup

    # @!group With right icon

    #
    # @param name
    # @param right_icon select {{ Essence::IconComponent::NAME_OPTIONS }}
    # @param disabled
    #
    # @label Primary (default)
    #
    def primary_right_icon(name: 'Button text',
                           url: nil,
                           disabled: false,
                           right_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::ButtonComponent.new(name:, url:, variant: :primary, disabled:) do |button|
        button.with_right_icon right_icon
      end
    end

    #
    # @label Secondary
    #
    def secondary_right_icon(name: 'Button text',
                             url: nil,
                             disabled: false,
                             right_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::ButtonComponent.new(name:, url:, variant: :secondary, disabled:) do |button|
        button.with_right_icon right_icon
      end
    end

    #
    # @label Danger
    #
    def danger_right_icon(name: 'Button text',
                          url: nil,
                          disabled: false,
                          right_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::ButtonComponent.new(name:, url:, variant: :danger, disabled:) do |button|
        button.with_right_icon right_icon
      end
    end

    #
    # @label Outline
    #
    def outline_right_icon(name: 'Button text',
                           url: nil,
                           disabled: false,
                           right_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::ButtonComponent.new(name:, url:, variant: :outline, disabled:) do |button|
        button.with_right_icon right_icon
      end
    end

    # @!endgroup

    # @!group Displayed as link

    #
    # @param name
    #
    # @label Primary (default)
    #
    def as_link_primary(name: 'Button text',
                        url: nil)
      render Essence::ButtonComponent.new(name:, url:, variant: :primary, display_as: :link)
    end

    #
    # @label Secondary
    #
    def as_link_secondary(name: 'Button text',
                          url: nil)
      render Essence::ButtonComponent.new(name:, url:, variant: :secondary, display_as: :link)
    end

    #
    # @label Danger
    #
    def as_link_danger(name: 'Button text',
                       url: nil)
      render Essence::ButtonComponent.new(name:, url:, variant: :danger, display_as: :link)
    end

    # @!endgroup
  end
end

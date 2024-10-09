# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  class LinkComponentPreview < ViewComponent::Preview
    # @!group Base

    #
    # @param name
    #
    # @label Primary (default)
    #
    def primary(name: 'Link text',
                url: '#')
      render Essence::LinkComponent.new(name:, url:, variant: :primary)
    end

    #
    # @label Secondary
    #
    def secondary(name: 'Link text',
                  url: '#')
      render Essence::LinkComponent.new(name:, url:, variant: :secondary)
    end

    #
    # @label Danger
    #
    def danger(name: 'Link text',
               url: '#')
      render Essence::LinkComponent.new(name:, url:, variant: :danger)
    end

    # @!endgroup

    # @!group With left icon

    #
    # @param name
    # @param left_icon select {{ Essence::IconComponent::NAME_OPTIONS }}
    #
    # @label Primary (default)
    #
    def primary_left_icon(name: 'Link text',
                          url: '#',
                          left_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::LinkComponent.new(name:, url:, variant: :primary) do |link|
        link.with_left_icon left_icon
      end
    end

    #
    # @label Secondary
    #
    def secondary_left_icon(name: 'Link text',
                            url: '#',
                            left_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::LinkComponent.new(name:, url:, variant: :secondary) do |link|
        link.with_left_icon left_icon
      end
    end

    #
    # @label Danger
    #
    def danger_left_icon(name: 'Link text',
                         url: '#',
                         left_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::LinkComponent.new(name:, url:, variant: :danger) do |link|
        link.with_left_icon left_icon
      end
    end

    # @!endgroup

    # @!group With right icon

    #
    # @param name
    # @param right_icon select {{ Essence::IconComponent::NAME_OPTIONS }}
    #
    # @label Primary (default)
    #
    def primary_right_icon(name: 'Link text',
                           url: '#',
                           right_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::LinkComponent.new(name:, url:, variant: :primary) do |link|
        link.with_right_icon right_icon
      end
    end

    #
    # @label Secondary
    #
    def secondary_right_icon(name: 'Link text',
                             url: '#',
                             right_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::LinkComponent.new(name:, url:, variant: :secondary) do |link|
        link.with_right_icon right_icon
      end
    end

    #
    # @label Danger
    #
    def danger_right_icon(name: 'Link text',
                          url: '#',
                          right_icon: Essence::IconComponent::NAME_OPTIONS.first)
      render Essence::LinkComponent.new(name:, url:, variant: :danger) do |link|
        link.with_right_icon right_icon
      end
    end

    # @!endgroup

    # @!group Displayed as button

    #
    # @param name
    #
    # @label Primary (default)
    #
    def as_button_primary(name: 'Link text',
                          url: '#')
      render Essence::LinkComponent.new(name:, url:, variant: :primary, display_as: :button)
    end

    #
    # @label Secondary
    #
    def as_button_secondary(name: 'Link text',
                            url: '#')
      render Essence::LinkComponent.new(name:, url:, variant: :secondary, display_as: :button)
    end

    #
    # @label Danger
    #
    def as_button_danger(name: 'Link text',
                         url: '#')
      render Essence::LinkComponent.new(name:, url:, variant: :danger, display_as: :button)
    end

    #
    # @label Outline
    #
    def as_button_outline(name: 'Link text',
                          url: '#')
      render Essence::LinkComponent.new(name:, url:, variant: :outline, display_as: :button)
    end

    # @!endgroup
  end
end

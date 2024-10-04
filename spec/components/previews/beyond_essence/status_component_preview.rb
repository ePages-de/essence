# frozen_string_literal: true

module BeyondEssence
  #
  # @logical_path components
  #
  # @display wrapper card
  #
  class StatusComponentPreview < ViewComponent::Preview
    # @!group Base

    #
    # @param text
    #
    # @label Outline (default)
    #
    def outline(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :outline)
    end

    #
    # @label Todo
    #
    def todo(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :todo)
    end

    #
    # @label Active
    #
    def active(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :active)
    end

    #
    # @label Danger
    #
    def danger(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :danger)
    end

    # @!endgroup

    # @!group With dotted bubble

    #
    # @param text
    #
    # @label Outline (default)
    #
    def outline_with_dotted_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :outline, bubble: :dotted)
    end

    #
    # @label Todo
    #
    def todo_with_dotted_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :todo, bubble: :dotted)
    end

    #
    # @label Active
    #
    def active_with_dotted_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :active, bubble: :dotted)
    end

    #
    # @label Danger
    #
    def danger_with_dotted_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :danger, bubble: :dotted)
    end

    # @!endgroup

    # @!group With outline bubble

    #
    # @param text
    #
    # @label Outline (default)
    #
    def outline_with_outline_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :outline, bubble: :outline)
    end

    #
    # @label Todo
    #
    def todo_with_outline_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :todo, bubble: :outline)
    end

    #
    # @label Active
    #
    def active_with_outline_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :active, bubble: :outline)
    end

    #
    # @label Danger
    #
    def danger_with_outline_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :danger, bubble: :outline)
    end

    # @!endgroup

    # @!group With solid bubble

    #
    # @param text
    #
    # @label Outline (default)
    #
    def outline_with_solid_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :outline, bubble: :solid)
    end

    #
    # @label Todo
    #
    def todo_with_solid_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :todo, bubble: :solid)
    end

    #
    # @label Active
    #
    def active_with_solid_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :active, bubble: :solid)
    end

    #
    # @label Danger
    #
    def danger_with_solid_bubble(text: 'Status text')
      render BeyondEssence::StatusComponent.new(text:, variant: :danger, bubble: :solid)
    end

    # @!endgroup
  end
end

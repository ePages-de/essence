# frozen_string_literal: true

module Essence
  class ButtonComponent < ApplicationComponent
    attr_reader :name, :url, :html_options

    DEFAULT_DISPLAY_AS = :button

    DEFAULT_VARIANT = :primary

    DEFAULT_BUSY = false

    BUTTON_MAPPINGS = {
      DEFAULT_DISPLAY_AS => {
        DEFAULT_VARIANT => 'button-primary',
        secondary: 'button-secondary',
        danger: 'button-danger',
        outline: 'button-outline',
        copilot: 'button-copilot'
      }
    }.freeze

    VARIANT_MAPPINGS = BUTTON_MAPPINGS.merge(LinkComponent::LINK_MAPPINGS).freeze

    DISPLAY_AS_OPTIONS = VARIANT_MAPPINGS.keys.freeze

    [:left_icon, :right_icon].each do |icon_type|
      renders_one icon_type, lambda { |name|
        IconComponent.new(name:, class: 'button-icon')
      }
    end

    def initialize(name:,
                   url: nil,
                   variant: DEFAULT_VARIANT,
                   display_as: DEFAULT_DISPLAY_AS,
                   busy: DEFAULT_BUSY,
                   **html_options)
      @name         = name
      @url          = url
      @variant      = fetch_or_fallback(VARIANT_MAPPINGS[display_as.to_sym].keys, variant.to_sym, DEFAULT_VARIANT)
      @display_as   = fetch_or_fallback(DISPLAY_AS_OPTIONS, display_as.to_sym, DEFAULT_DISPLAY_AS)
      @busy         = fetch_or_fallback_boolean(busy, fallback: DEFAULT_BUSY)
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options(
        *css_classes,
        **options
      )
    end

    def css_classes
      classes = [
        @display_as.to_s,
        VARIANT_MAPPINGS.dig(@display_as.to_sym, @variant.to_sym)
      ]
      classes << 'button-busy' if @busy && display_as_button?

      classes
    end

    def options
      return {} unless display_as_button?

      { data: { controller: 'button' } }
    end

    def display_as_button?
      @display_as == :button
    end
  end
end

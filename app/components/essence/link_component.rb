# frozen_string_literal: true

module Essence
  class LinkComponent < ApplicationComponent
    attr_reader :name, :url, :variant, :html_options

    DEFAULT_DISPLAY_AS = :link

    DEFAULT_VARIANT = :primary

    LINK_MAPPINGS = {
      DEFAULT_DISPLAY_AS => {
        DEFAULT_VARIANT => 'link-primary',
        secondary: 'link-secondary',
        danger: 'link-danger'
      }
    }.freeze

    VARIANT_MAPPINGS = LINK_MAPPINGS.merge(ButtonComponent::BUTTON_MAPPINGS).freeze

    DISPLAY_AS_OPTIONS = VARIANT_MAPPINGS.keys.freeze

    [:left_icon, :right_icon].each do |icon_type|
      renders_one icon_type, lambda { |name|
        IconComponent.new(name:, class: 'link-icon')
      }
    end

    def initialize(name:,
                   url: nil,
                   variant: DEFAULT_VARIANT,
                   display_as: DEFAULT_DISPLAY_AS,
                   **html_options)
      @name         = name
      @url          = url
      @variant      = fetch_or_fallback(VARIANT_MAPPINGS[display_as.to_sym].keys, variant.to_sym, DEFAULT_VARIANT)
      @display_as   = fetch_or_fallback(DISPLAY_AS_OPTIONS, display_as.to_sym, DEFAULT_DISPLAY_AS)
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options(
        @display_as.to_s,
        VARIANT_MAPPINGS.dig(@display_as.to_sym, @variant.to_sym)
      )
    end
  end
end

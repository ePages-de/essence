# frozen_string_literal: true

module Essence
  class StatusComponent < ApplicationComponent
    attr_reader :text, :bubble, :html_options

    DEFAULT_VARIANT = :outline

    VARIANT_MAPPINGS = {
      DEFAULT_VARIANT => 'status-outline',
      :todo => 'status-todo',
      :active => 'status-active',
      :danger => 'status-danger'
    }.freeze

    VARIANT_OPTIONS = VARIANT_MAPPINGS.keys.freeze

    DEFAULT_BUBBLE = nil

    BUBBLE_MAPPINGS = {
      DEFAULT_BUBBLE => '',
      :dotted => 'status-bubble-dotted',
      :outline => 'status-bubble-outline',
      :solid => 'status-bubble-solid'
    }.freeze

    BUBBLE_OPTIONS = BUBBLE_MAPPINGS.keys.freeze

    def initialize(text:,
                   variant: DEFAULT_VARIANT,
                   bubble: DEFAULT_BUBBLE,
                   **html_options)
      @text         = text.presence&.strip&.downcase
      @variant      = fetch_or_fallback(VARIANT_OPTIONS, variant.to_sym, DEFAULT_VARIANT)
      @bubble       = fetch_or_fallback(BUBBLE_OPTIONS, bubble&.to_sym, DEFAULT_BUBBLE)
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options(
        'status',
        VARIANT_MAPPINGS[@variant]
      )
    end

    def render?
      text.present?
    end

    [:bubble].each do |method_name|
      define_method(:"#{method_name}?") do
        instance_variable_get(:"@#{method_name}").present?
      end
    end
  end
end

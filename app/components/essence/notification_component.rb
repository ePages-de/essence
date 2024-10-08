# frozen_string_literal: true

module Essence
  class NotificationComponent < ApplicationComponent
    attr_reader :icon, :html_options

    DEFAULT_VARIANT = :info

    VARIANT_MAPPINGS = {
      :success => 'notification-success',
      DEFAULT_VARIANT => 'notification-info',
      :warning => 'notification-warning',
      :danger => 'notification-danger'
    }.freeze

    VARIANT_OPTIONS = VARIANT_MAPPINGS.keys.freeze

    ICON_MAPPINGS = {
      :success => 'circle_check',
      DEFAULT_VARIANT => 'circle_info',
      :warning => 'circle_exclamation',
      :danger => 'circle_xmark'
    }.freeze

    def initialize(variant: DEFAULT_VARIANT,
                   **html_options)
      @variant      = fetch_or_fallback(VARIANT_OPTIONS, variant.to_sym, DEFAULT_VARIANT)
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options
      set_icon
    end

    def set_icon
      @icon = ICON_MAPPINGS[@variant]
    end

    def set_base_html_options
      base_html_options = {
        class: class_names(
          'notification',
          VARIANT_MAPPINGS[@variant]
        )
      }

      @html_options = merge_options(base_html_options, @html_options)
    end
  end
end

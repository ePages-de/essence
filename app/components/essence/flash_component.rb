# frozen_string_literal: true

module Essence
  class FlashComponent < NotificationComponent
    class ContainerComponent < ApplicationComponent; end

    VARIANT_MAPPINGS = {
      :success => 'flash-success',
      :notice => 'flash-notice',
      DEFAULT_VARIANT => 'flash-info',
      :warning => 'flash-warning',
      :danger => 'flash-danger',
      :alert => 'flash-danger'
    }.freeze

    private

    def before_render
      set_base_html_options(
        'flash',
        VARIANT_MAPPINGS[@variant],
        data: {
          controller: 'flash'
        }
      )
      set_icon
    end
  end
end

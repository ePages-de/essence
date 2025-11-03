# frozen_string_literal: true

module Essence
  class CardComponent < ApplicationComponent
    attr_reader :headline, :sub_headline, :html_options

    renders_one :ribbon, 'RibbonComponent'

    def initialize(headline: nil,
                   sub_headline: nil,
                   **html_options)
      @headline       = headline
      @sub_headline   = sub_headline
      @html_options   = html_options
    end

    class RibbonComponent < ApplicationComponent
      attr_reader :text, :html_options

      DEFAULT_VARIANT = :light

      VARIANT_MAPPINGS = {
        DEFAULT_VARIANT => 'card-ribbon-light',
        :dark => 'card-ribbon-dark'
      }.freeze

      VARIANT_OPTIONS = VARIANT_MAPPINGS.keys.freeze

      def initialize(text:,
                     variant: DEFAULT_VARIANT,
                     **html_options)
        @text         = text
        @variant      = fetch_or_fallback(VARIANT_OPTIONS, variant.to_sym, DEFAULT_VARIANT)
        @html_options = html_options
      end

      private

      def before_render
        set_base_html_options(
          'card-ribbon',
          VARIANT_MAPPINGS[@variant]
        )
      end
    end

    private

    def before_render
      set_base_html_options('card')
    end

    def render?
      content?
    end

    [:headline, :sub_headline].each do |method_name|
      define_method(:"#{method_name}?") do
        instance_variable_get(:"@#{method_name}").present?
      end
    end
  end
end

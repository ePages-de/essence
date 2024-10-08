# frozen_string_literal: true

module Essence
  class CardComponent < ApplicationComponent
    attr_reader :headline, :html_options

    def initialize(headline: nil,
                   **html_options)
      @headline     = headline
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options
    end

    def render?
      content?
    end

    def set_base_html_options
      base_html_options = {
        class: class_names(
          'card'
        )
      }

      @html_options = merge_options(base_html_options, @html_options)
    end

    [:headline].each do |method_name|
      define_method(:"#{method_name}?") do
        instance_variable_get(:"@#{method_name}").present?
      end
    end
  end
end

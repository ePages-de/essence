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
      set_base_html_options('card')
    end

    def render?
      content?
    end

    [:headline].each do |method_name|
      define_method(:"#{method_name}?") do
        instance_variable_get(:"@#{method_name}").present?
      end
    end
  end
end

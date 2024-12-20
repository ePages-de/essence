# frozen_string_literal: true

module Essence
  class EmptyStateComponent < ApplicationComponent
    attr_reader :image_path, :headline, :body, :link_text, :link_url, :html_options

    def initialize(image_path:,
                   headline:,
                   body:,
                   link_text: nil,
                   link_url: nil,
                   **html_options)
      @image_path   = image_path
      @headline     = headline
      @body         = body
      @link_text    = link_text
      @link_url     = link_url
      @html_options = html_options
    end

    private

    [:link_text, :link_url].each do |method_name|
      define_method(:"#{method_name}?") do
        instance_variable_get(:"@#{method_name}").present?
      end
    end

    def before_render
      set_base_html_options('empty-state')
    end
  end
end

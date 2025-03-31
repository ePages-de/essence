# frozen_string_literal: true

module Essence
  class ApplicationComponent < ViewComponent::Base
    include FetchOrFallbackHelper
    extend Utils

    class << self
      def images_directory
        Essence::Engine.root.join("app/assets/images/#{assets_path}")
      end

      def assets_path
        name.underscore
      end
    end

    delegate :assets_path, to: :class

    private

    def set_base_html_options(*class_names, **html_options)
      base_html_options = {
        class: class_names(*class_names), **html_options
      }

      @html_options = merge_options(base_html_options, @html_options)
    end

    def merge_options(base_options, options)
      base_options.deep_merge!(options) { |_key, value_1, value_2| "#{value_1} #{value_2}" }
    end
  end
end

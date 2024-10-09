# frozen_string_literal: true

module Essence
  class ApplicationComponent < ViewComponent::Base
    include FetchOrFallbackHelper
    extend Utils

    def self.images_directory
      Essence::Engine.root.join("app/assets/images/#{assets_path}")
    end

    def self.assets_path
      name.underscore
    end

    def assets_path
      self.class.assets_path
    end

    private

    def merge_options(base_options, options)
      base_options.deep_merge!(options) { |_key, value_1, value_2| "#{value_1} #{value_2}" }
    end
  end
end

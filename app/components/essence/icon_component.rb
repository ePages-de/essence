# frozen_string_literal: true

module Essence
  class IconComponent < ApplicationComponent
    attr_reader :file, :html_options

    NAME_OPTIONS = get_directory_file_names(images_directory, :svg).sort.freeze

    def initialize(name:,
                   **html_options)
      @name         = fetch_or_fallback(NAME_OPTIONS, name.to_s.underscore)
      @html_options = html_options
    end

    private

    def before_render
      set_file
    end

    def set_file
      @file = "#{assets_path}/#{@name}.svg"
    end
  end
end

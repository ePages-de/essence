# frozen_string_literal: true

module BeyondEssence
  class IconComponent < ApplicationComponent
    attr_reader :path, :html_options

    NAME_OPTIONS = get_directory_file_names(images_directory, :svg).sort.freeze

    def initialize(name:,
                   **html_options)
      @name         = fetch_or_fallback(NAME_OPTIONS, name.to_s.underscore)
      @html_options = html_options
    end

    private

    def before_render
      set_path
    end

    def set_path
      @path = "#{assets_path}/#{@name}.svg"
    end
  end
end

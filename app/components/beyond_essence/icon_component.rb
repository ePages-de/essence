# frozen_string_literal: true

module BeyondEssence
  class IconComponent < ApplicationComponent
    attr_reader :path, :html_options

    NAME_OPTIONS = get_directory_icons(BeyondEssence::Engine.root.join('app/assets/images/beyond_essence/components/icon_component')).sort.freeze

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
      @path = "beyond_essence/components/icon_component/#{@name}.svg"
    end
  end
end

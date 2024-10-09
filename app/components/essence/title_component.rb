# frozen_string_literal: true

module Essence
  class TitleComponent < ApplicationComponent
    attr_reader :text, :html_options

    def initialize(text:, **html_options)
      @text         = text
      @html_options = html_options
    end

    private

    def render?
      @text.present?
    end

    def before_render
      set_base_html_options('title')
    end
  end
end

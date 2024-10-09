# frozen_string_literal: true

module Essence
  class StepListComponent < ApplicationComponent
    attr_reader :title, :html_options

    renders_many :items, 'ItemComponent'

    def initialize(title:,
                   **html_options)
      @title        = title
      @html_options = html_options
    end

    class ItemComponent < ApplicationComponent
      attr_reader :headline, :description

      def initialize(headline:, description:)
        @headline    = headline
        @description = description
      end
    end

    private

    def before_render
      set_base_html_options
    end

    def render?
      items.any?
    end

    def set_base_html_options
      base_html_options = {
        class: class_names(
          'step-list'
        )
      }

      @html_options = merge_options(base_html_options, @html_options)
    end
  end
end

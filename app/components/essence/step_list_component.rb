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
      set_base_html_options('step-list')
    end

    def render?
      items.any?
    end
  end
end

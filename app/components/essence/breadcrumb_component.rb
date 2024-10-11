# frozen_string_literal: true

module Essence
  class BreadcrumbComponent < ApplicationComponent
    attr_reader :html_options

    def initialize(**html_options)
      @html_options = html_options
    end

    private

    def before_render
      set_base_html_options('breadcrumb')
    end
  end
end

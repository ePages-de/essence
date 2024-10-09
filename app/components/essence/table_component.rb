# frozen_string_literal: true

module Essence
  class TableComponent < ApplicationComponent
    attr_reader :columns, :rows, :html_options

    def initialize(rows: [], **html_options)
      @columns      = []
      @rows         = rows
      @html_options = html_options
    end

    def column(label, &)
      @columns << Column.new(label, &)
    end

    private

    class Column
      attr_reader :label, :block

      def initialize(label, &block)
        @label = label
        @block = block
      end
    end

    def before_render
      content # Used to call the block and populate the columns
      set_base_html_options('table')
    end
  end
end

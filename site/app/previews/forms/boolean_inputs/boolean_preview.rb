# frozen_string_literal: true

module Forms
  module BooleanInputs
    #
    # @display wrapper card
    #
    class BooleanPreview < Lookbook::Preview
      #
      # @param required toggle
      # @param label toggle
      # @param disabled toggle
      # @param error toggle
      #
      def base(required: true,
               label: true,
               disabled: false,
               error: false)
        render 'lookbook/previews/forms/boolean_inputs/boolean', required:, disabled:, label:, error:
      end
    end
  end
end

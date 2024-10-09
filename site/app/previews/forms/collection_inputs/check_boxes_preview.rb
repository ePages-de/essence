# frozen_string_literal: true

module Forms
  module CollectionInputs
    #
    # @display wrapper card
    #
    class CheckBoxesPreview < Lookbook::Preview
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
        render 'lookbook/previews/forms/collection_inputs/check_boxes', required:, disabled:, label:, error:
      end
    end
  end
end

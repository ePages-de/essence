# frozen_string_literal: true

module Forms
  module SelectInputs
    #
    # @display wrapper card
    #
    class CountryPreview < Lookbook::Preview
      #
      # @param required toggle
      # @param label toggle
      # @param hint toggle
      # @param prompt toggle
      # @param disabled toggle
      # @param error toggle
      #
      def base(required: true,
               label: true,
               hint: true,
               prompt: false,
               disabled: false,
               error: false)
        render 'lookbook/previews/forms/select_inputs/country', required:, disabled:, label:, hint:, prompt:,
                                                                error:
      end
    end
  end
end

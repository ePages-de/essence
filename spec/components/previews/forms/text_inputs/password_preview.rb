# frozen_string_literal: true

module Forms
  module TextInputs
    #
    # @display wrapper card
    #
    class PasswordPreview < Lookbook::Preview
      #
      # @param required toggle
      # @param label toggle
      # @param hint toggle
      # @param placeholder toggle
      # @param disabled toggle
      # @param error toggle
      #
      def base(required: true,
               label: true,
               hint: true,
               placeholder: false,
               disabled: false,
               error: false)
        render 'lookbook/previews/forms/text_inputs/password', required:, disabled:, label:, hint:, placeholder:, error:
      end
    end
  end
end
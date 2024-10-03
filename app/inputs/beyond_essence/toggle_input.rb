# frozen_string_literal: true

module BeyondEssence
  class ToggleInput < SimpleForm::Inputs::BooleanInput
    def input(wrapper_options = nil)
      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

      @builder.label(attribute_name, merged_input_options) { '' } +
        build_check_box(unchecked_value, {})
    end
  end
end

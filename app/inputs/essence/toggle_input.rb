# frozen_string_literal: true

module Essence
  class ToggleInput < SimpleForm::Inputs::BooleanInput
    def input(wrapper_options = nil)
      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

      check_box_options = merged_input_options.slice!(:class)

      @builder.label(attribute_name, merged_input_options) { '' } +
        build_check_box(unchecked_value, check_box_options)
    end
  end
end

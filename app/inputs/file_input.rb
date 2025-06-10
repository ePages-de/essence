# frozen_string_literal: true

class FileInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options = nil)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    template.content_tag(:div, **stimulus_configuration) do
      template.concat(build_file_button_label(merged_input_options))
      template.concat(build_filename_display)
      template.concat(build_hidden_file_field)
    end
  end

  private

  def build_file_button_label(merged_options)
    template.content_tag(:label, button_text,
                         merged_options.merge(for: input_id, data: { file_input_target: 'button' }))
  end

  def build_filename_display
    template.content_tag(:span, filename, class: 'form-label file-name',
                                          data: { file_input_target: 'fileName' })
  end

  def build_hidden_file_field
    @builder.file_field(attribute_name, style: 'display: none;',
                                        data: { file_input_target: 'input', action: 'change->file-input#change' })
  end

  def input_id
    ActionView::Helpers::Tags::Base.new(@builder.object_name, attribute_name, template).send(:tag_id)
  end

  def stimulus_configuration
    {
      data: {
        controller: 'file-input',
        file_input_change_file_text_value: translate_text(:change_file),
        file_input_button_text_value: translate_text(:choose_file)
      }
    }
  end

  def button_text
    file_present? ? translate_text(:change_file) : translate_text(:choose_file)
  end

  def translate_text(key)
    I18n.t("simple_form.file_input.#{key}")
  end

  def file_present?
    return false unless @builder.object.respond_to?(attribute_name)

    file = @builder.object.send(attribute_name)

    file.present? && file.respond_to?(:filename)
  end

  def filename
    return nil unless file_present?

    @builder.object.send(attribute_name).filename
  rescue StandardError
    nil
  end
end

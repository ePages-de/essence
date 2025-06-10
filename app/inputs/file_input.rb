# frozen_string_literal: true

class FileInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options = nil)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    template.content_tag(:div, **stimulus_configuration) do
      template.concat(
        template.content_tag(:label, button_text,
                             merged_input_options.merge(for: input_id, data: { file_input_target: 'button' }))
      )
      template.concat(
        template.content_tag(:span, filename, class: 'form-label file-name',
                                              data: { file_input_target: 'fileName' })
      )
      template.concat(
        @builder.file_field(attribute_name, style: 'display: none;',
                                            data: { file_input_target: 'input', action: 'change->file-input#change' })
      )
    end
  end

  private

  def input_id
    ActionView::Helpers::Tags::Base.new(@builder.object_name, attribute_name, template).send(:tag_id)
  end

  def stimulus_configuration
    {
      data: {
        controller: 'file-input',
        file_input_change_file_text_value: I18n.t('simple_form.file_input.change_file'),
        file_input_button_text_value: I18n.t('simple_form.file_input.choose_file')
      }
    }
  end

  def change_file_text
    I18n.t('simple_form.file_input.change_file')
  end

  def button_text
    file_present? ? I18n.t('simple_form.file_input.change_file') : I18n.t('simple_form.file_input.choose_file')
  end

  def file_present?
    @builder.object.send(attribute_name).present? && @builder.object.send(attribute_name).respond_to?(:filename)
  end

  def filename
    @builder.object.send(attribute_name).respond_to?(:filename) ? @builder.object.send(attribute_name).filename : nil
  rescue StandardError
    nil
  end
end

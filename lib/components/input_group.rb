# frozen_string_literal: true

module Components
  module InputGroup
    def prepend(_wrapper_options = nil)
      return if options[:prepend].blank?

      @prepend ||= template.content_tag(:div, options[:prepend], class: 'form-control-prepend')
    end

    def append(_wrapper_options = nil)
      return if options[:append].blank?

      @append ||= template.content_tag(:div, options[:append], class: 'form-control-append')
    end
  end
end

SimpleForm.include_component(Components::InputGroup)

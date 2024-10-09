# frozen_string_literal: true

# Uncomment this and change the path if necessary to include your own
# components.
# See https://github.com/heartcombo/simple_form#custom-components
# to know more about custom components.
# Dir[Rails.root.join('lib/components/**/*.rb')].each { |f| require f }

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Default class for buttons
  config.button_class = 'button button-primary'

  # How the label text should be generated altogether with the required text.
  config.label_text = ->(label, required, _explicit_label) { "#{label} #{required}" }

  # Define the way to render check boxes / radio buttons with labels.
  config.boolean_style = :inline

  # You can wrap each item in a collection of radio/check boxes with a tag
  config.item_wrapper_tag = :div

  # Defines if the default input wrapper class should be included in radio
  # collection wrappers.
  config.include_default_input_wrapper_class = false

  # Method used to tidy up errors. Specify any Rails Array method.
  # :first lists the first message for each field.
  # :to_sentence to list all errors for each field.
  config.error_method = :first

  # Vertical forms

  config.wrappers :vertical_text,
                  class: 'form-row' do |b|
    b.use :html5 # rubocop:disable Naming/VariableNumber
    b.use :placeholder

    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    b.use :label, class: 'form-label'
    b.wrapper class: 'form-wrapper' do |bb|
      bb.wrapper class: 'form-group' do |bbb|
        bbb.optional :prepend
        bbb.use :input, class: 'form-control', error_class: 'invalid', valid_class: 'valid'
        bbb.optional :append
      end
      bb.use :error, wrap_with: { tag: :p, class: 'form-error' }
    end
    b.use :hint, wrap_with: { tag: :div, class: 'form-hint' }
  end

  config.wrappers :vertical_select,
                  class: 'form-row' do |b|
    b.use :html5 # rubocop:disable Naming/VariableNumber

    b.use :label, class: 'form-label'
    b.wrapper class: 'form-wrapper' do |bb|
      bb.wrapper class: 'form-group' do |bbb|
        bbb.use :input, class: 'form-control', error_class: 'invalid', valid_class: 'valid'
      end
      bb.use :error, wrap_with: { tag: :p, class: 'form-error' }
    end
    b.use :hint, wrap_with: { tag: :div, class: 'form-hint' }
  end

  config.wrappers :vertical_boolean,
                  class: 'form-row' do |b|
    b.use :html5 # rubocop:disable Naming/VariableNumber

    b.wrapper class: 'form-wrapper' do |bb|
      bb.wrapper class: 'form-group' do |bbb|
        bbb.use :input, class: 'form-control', error_class: 'invalid', valid_class: 'valid'
        bbb.use :label, class: 'form-label'
      end
      bb.use :error, wrap_with: { tag: :p, class: 'form-error' }
    end
  end

  config.wrappers :vertical_collection,
                  item_wrapper_class: 'form-group',
                  item_label_class: 'form-label',
                  tag: :fieldset,
                  class: 'form-row form-fieldset' do |b|
    b.use :html5 # rubocop:disable Naming/VariableNumber

    b.wrapper :legend_tag, tag: :legend, class: 'form-legend' do |bb|
      bb.use :label_text
    end
    b.wrapper class: 'form-wrapper' do |bb|
      bb.use :input, class: 'form-control', error_class: 'invalid', valid_class: 'valid'
      bb.use :error, wrap_with: { tag: :p, class: 'form-error' }
    end
  end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :vertical_text

  # Custom wrappers for input types. This should be a hash containing an input
  # type as key and the wrapper that will be used for all inputs with specified type.
  config.wrapper_mappings = {
    boolean: :vertical_boolean,
    check_boxes: :vertical_collection,
    radio_buttons: :vertical_collection,
    select: :vertical_select,
    country: :vertical_select,
    toggle: :vertical_boolean
  }

  # Namespaces where SimpleForm should look for custom input classes that
  # override default inputs.
  config.custom_inputs_namespaces << 'Essence'
end

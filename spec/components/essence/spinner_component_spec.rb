# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Essence::SpinnerComponent, type: :component do
  it 'renders the component' do
    render_inline(described_class.new)

    expect(page).to have_css 'body > span.spinner', count: 1
  end

  it 'renders with the given :html_options' do
    render_inline(described_class.new(class: 'custom-class', data: { john: 'doe' }))

    expect(page).to have_css 'body > span.spinner.custom-class[data-john="doe"]', count: 1
  end
end

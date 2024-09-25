# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BeyondEssence::TitleComponent, type: :component do
  let(:text) { 'Title text' }

  it 'renders the component' do
    render_inline(described_class.new(text:))

    expect(page).to have_css 'body > h1.title', text:, count: 1
  end

  it 'renders with the given :html_options' do
    render_inline(described_class.new(text:, class: 'custom-class', data: { john: 'doe' }))

    expect(page).to have_css 'body > h1.title.custom-class[data-john="doe"]', text:, count: 1
  end
end

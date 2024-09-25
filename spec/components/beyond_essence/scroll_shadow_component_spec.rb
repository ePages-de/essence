# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BeyondEssence::ScrollShadowComponent, type: :component do
  let(:content) { 'Scroll Shadow content' }

  it 'renders the component' do
    render_inline(described_class.new) do
      content.html_safe
    end

    expect(page).to have_css 'body > scroll-shadow > div.scroll-shadow', text: content
  end

  it 'renders with the given :html_options' do
    render_inline(described_class.new(class: 'custom-class', data: { john: 'doe' })) do
      content.html_safe
    end

    expect(page).to have_css 'body > scroll-shadow > div.scroll-shadow.custom-class[data-john="doe"]', text: content
  end
end

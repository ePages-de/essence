# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Essence::CardComponent, type: :component do
  let(:headline) { 'Card headline' }
  let(:content) { 'Card content' }

  it 'renders the component' do
    render_inline(described_class.new(headline:)) do
      content
    end

    aggregate_failures do
      expect(page).to have_css 'body > div.card > h2.card-headline', text: headline, count: 1
      expect(page).to have_css 'body > div.card > div.card-content', text: content, count: 1
    end
  end

  it 'renders without the headline' do
    render_inline(described_class.new) do
      content
    end

    aggregate_failures do
      expect(page).to have_no_css 'body > div.card > h2.card-headline'
      expect(page).to have_css 'body > div.card > div.card-content', text: content, count: 1
    end
  end

  it 'renders with the given :html_options' do
    render_inline(described_class.new(class: 'custom-class', data: { john: 'doe' })) do
      content
    end

    expect(page).to have_css 'body > div.card.custom-class[data-john="doe"] > div.card-content', text: content, count: 1
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BeyondEssence::StepListComponent, type: :component do
  let(:title) { 'Step list title' }
  let(:items) do
    [
      {
        headline: 'Establish a Connection',
        description: 'Connect your device to Wi-Fi or Ethernet and verify by opening a website.'
      },
      {
        headline: 'Launch Your Browser',
        description: 'Open your browser (e.g., Chrome, Firefox) and ensure it\'s up to date.'
      },
      {
        headline: 'Enter the URL',
        description: 'Type the website URL in the address bar and press "Enter".'
      }
    ]
  end

  it 'renders the component' do
    render_inline(described_class.new(title:)) do |step_list|
      step_list.with_items(items)
    end

    aggregate_failures do
      expect(page).to have_css 'body > div.step-list > h4.step-list-title', text: title, count: 1
      expect(page).to have_css 'body > div.step-list > div.step-list-items > div.step-list-item > div > div.step-list-bubble',
                               count: 3
      expect(page).to have_css 'body > div.step-list > div.step-list-items > div.step-list-item > div > strong.step-list-headline',
                               count: 3
      expect(page).to have_css 'body > div.step-list > div.step-list-items > div.step-list-item > div > p.step-list-description',
                               count: 3

      items.each.with_index(1) do |item, index|
        expect(page).to have_css "body > div.step-list > div.step-list-items > div.step-list-item:nth-child(#{index}) > div > strong.step-list-headline",
                                 text: item[:headline], count: 1
        expect(page).to have_css "body > div.step-list > div.step-list-items > div.step-list-item:nth-child(#{index}) > div > p.step-list-description",
                                 text: item[:description], count: 1
      end
    end
  end
end

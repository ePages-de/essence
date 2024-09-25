# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BeyondEssence::TooltipComponent, type: :component do
  let(:text) { 'Tooltip text' }

  it 'renders the component' do
    render_inline(described_class.new(text:))

    aggregate_failures do
      # TODO: Add validation for data-tooltip-target="icon"
      # TODO: Validate the correct icon
      expect(page).to have_css "body > span.tooltip[data-controller='tooltip'] > svg.tooltip-icon",
                               count: 1
      expect(page).to have_css 'body > span.tooltip > span.tooltip-bubble[data-tooltip-target="bubble"]', text:,
                                                                                                          count: 1
      expect(page).to have_css 'body > span.tooltip > span.tooltip-bubble > span.tooltip-arrow[data-tooltip-target="arrow"]',
                               count: 1
    end
  end

  it 'renders with the given :html_options' do
    render_inline(described_class.new(text:, class: 'custom-class', data: { john: 'doe' }))

    aggregate_failures do
      # TODO: Add validation for data-tooltip-target="icon"
      # TODO: Validate the correct icon
      expect(page).to have_css "body > span.tooltip.custom-class[data-john='doe'][data-controller='tooltip'] > svg.tooltip-icon",
                               count: 1
      expect(page).to have_css 'body > span.tooltip > span.tooltip-bubble[data-tooltip-target="bubble"]', text:,
                                                                                                          count: 1
      expect(page).to have_css 'body > span.tooltip > span.tooltip-bubble > span.tooltip-arrow[data-tooltip-target="arrow"]',
                               count: 1
    end
  end
end

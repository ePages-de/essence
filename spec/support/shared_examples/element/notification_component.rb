# frozen_string_literal: true

RSpec.shared_examples 'notification component' do |variant|
  let(:content) { 'Notification text' }

  it 'renders the component' do
    render_inline(described_class.new(variant:)) do
      content
    end

    aggregate_failures do
      # TODO: Validate the correct icon
      expect(page).to have_css "body > div.notification.notification-#{variant} > div.notification-indicator > svg.notification-icon",
                               count: 1
      expect(page).to have_css "body > div.notification.notification-#{variant} > div.notification-body",
                               text: content, count: 1
    end
  end

  it 'renders with the given :html_options' do
    render_inline(described_class.new(variant:, class: 'custom-class', data: { john: 'doe' })) do
      content
    end

    aggregate_failures do
      # TODO: Validate the correct icon
      expect(page).to have_css "body > div.notification.notification-#{variant}.custom-class[data-john='doe']", count: 1
      expect(page).to have_css "body > div.notification.notification-#{variant} > div.notification-indicator > svg.notification-icon",
                               count: 1
      expect(page).to have_css "body > div.notification.notification-#{variant} > div.notification-body",
                               text: content, count: 1
    end
  end
end

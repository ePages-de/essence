# frozen_string_literal: true

RSpec.shared_examples 'status component' do |variant|
  let(:text) { 'Status text' }

  it 'renders the component' do
    render_inline(described_class.new(text:, variant:))

    aggregate_failures do
      expect(page).to have_css "body > div.status.status-#{variant}", text: text.underscore, count: 1
      expect(page).to have_no_css "body > div.status.status-#{variant} > span.status-bubble"
    end
  end

  it 'renders with the given :html_options' do
    render_inline(described_class.new(text:, variant:, class: 'custom-class', data: { john: 'doe' }))

    aggregate_failures do
      expect(page).to have_css "body > div.status.status-#{variant}.custom-class[data-john='doe']",
                               text: text.underscore, count: 1
      expect(page).to have_no_css "body > div.status.status-#{variant} > span.status-bubble"
    end
  end

  [:dotted, :outline, :solid].each do |bubble|
    it "renders with #{bubble} bubble" do
      render_inline(described_class.new(text:, variant:, bubble:))

      aggregate_failures do
        expect(page).to have_css "body > div.status.status-#{variant}", text: text.underscore, count: 1
        expect(page).to have_css "body > div.status.status-#{variant} > span.status-bubble.status-bubble-#{bubble}",
                                 count: 1
      end
    end
  end
end

# frozen_string_literal: true

RSpec.shared_examples 'link component' do |variant|
  let(:name) { 'Link text' }
  let(:url) { '#' }

  it 'renders the component' do
    render_inline(described_class.new(name:, url:, variant:))

    expect(page).to have_css "body > a.link.link-#{variant} > span", text: name, count: 1
  end

  it 'renders with the given :html_options' do
    render_inline(described_class.new(name:, url:, variant:, class: 'custom-class', data: { john: 'doe' }))

    expect(page).to have_css "body > a.link.link-#{variant}.custom-class[data-john='doe'] > span", text: name, count: 1
  end

  it 'renders with the given :left_icon' do
    render_inline(described_class.new(name:, url:, variant:)) do |link|
      link.with_left_icon 'arrow_up_right_from_square'
    end

    aggregate_failures do
      # TODO: Validate the correct icon
      expect(page).to have_css "body > a.link.link-#{variant} > svg.link-icon:first-child", count: 1
      expect(page).to have_css "body > a.link.link-#{variant} > span:last-child", text: name, count: 1
    end
  end

  it 'renders with the given :right_icon' do
    render_inline(described_class.new(name:, url:, variant:)) do |link|
      link.with_right_icon 'arrow_up_right_from_square'
    end

    aggregate_failures do
      # TODO: Validate the correct icon
      expect(page).to have_css "body > a.link.link-#{variant} > span:first-child", text: name, count: 1
      expect(page).to have_css "body > a.link.link-#{variant} > svg.link-icon:last-child", count: 1
    end
  end
end

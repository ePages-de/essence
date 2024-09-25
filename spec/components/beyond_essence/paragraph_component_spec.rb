# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BeyondEssence::ParagraphComponent, type: :component do
  let(:content) { 'Typography content' }
  let(:arrow_up_right_from_square_icon) { '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M21 13v10H0V4h12v2H2v15h17v-8h2zm3-12H13.012l4.035 4-6.977 7.07 2.828 2.828 6.977-7.07L24 12V1z"></path></svg>' }

  it 'renders the component' do
    render_inline(described_class.new) do
      content
    end

    expect(page).to have_css "body > div.paragraph[data-controller='paragraph'][data-paragraph-external-icon-value='#{arrow_up_right_from_square_icon}']",
                             text: content, count: 1
  end

  it 'renders with the given :html_options' do
    render_inline(described_class.new(class: 'custom-class', data: { john: 'doe' })) do
      content
    end

    expect(page).to have_css 'body > div.paragraph.custom-class[data-john="doe"]', text: content, count: 1
  end
end

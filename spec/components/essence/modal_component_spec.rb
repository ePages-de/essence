# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Essence::ModalComponent, type: :component do
  let(:title) { 'Confirm action' }

  def build(**kwargs, &block)
    render_inline(described_class.new(title:, **kwargs), &block)
  end

  describe 'basic rendering' do
    it 'renders with required title' do
      build
      expect(page).to have_css '.modal__title', text: title
    end

    it 'renders arbitrary body content' do
      build { 'Hello, modal!' }
      expect(page).to have_css '.modal__body', text: 'Hello, modal!'
    end
  end

  describe 'turbo frame wrapper' do
    it 'has id="modal"' do
      build
      expect(page).to have_css 'turbo-frame#modal'
    end
  end

  describe 'accessibility' do
    it 'applies role="dialog"' do
      build
      expect(page).to have_css '.modal[role="dialog"]'
    end

    it 'applies aria-modal="true"' do
      build
      expect(page).to have_css '.modal[aria-modal="true"]'
    end

    it 'aria-labelledby points to the title element id' do
      build
      labelledby = page.find('.modal')['aria-labelledby']
      expect(page).to have_css "##{labelledby}.modal__title", text: title
    end
  end

  describe 'dismiss_icon' do
    context 'when false (default)' do
      it 'does not render the close button' do
        build
        expect(page).to have_no_css '.modal__close'
      end
    end

    context 'when true' do
      it 'renders the close button with click->modal#hideModal action' do
        build(dismiss_icon: true)
        expect(page).to have_css '.modal__close[data-action*="click->modal#hideModal"]'
      end
    end
  end

  describe 'dismiss_keyup' do
    context 'when true' do
      it 'includes keyup@window->modal#closeWithKeyboard in data-action' do
        build(dismiss_keyup: true)
        expect(page).to have_css '.modal[data-action*="keyup@window->modal#closeWithKeyboard"]'
      end
    end
  end

  describe 'dismiss_click' do
    context 'when true' do
      it 'includes click@window->modal#closeBackground in data-action' do
        build(dismiss_click: true)
        expect(page).to have_css '.modal[data-action*="click@window->modal#closeBackground"]'
      end
    end
  end

  describe 'dismiss_submit' do
    context 'when true' do
      it 'includes turbo:submit-end->modal#submitEnd in data-action' do
        build(dismiss_submit: true)
        expect(page).to have_css '.modal[data-action*="turbo:submit-end->modal#submitEnd"]'
      end
    end
  end

  describe 'all dismisses off (default)' do
    it 'data-action is absent or empty' do
      build
      node = page.find('.modal')
      action = node['data-action']
      expect(action.to_s.strip).to be_empty
    end
  end

  describe 'footer slot' do
    it 'is absent by default' do
      build
      expect(page).to have_no_css '.modal__footer'
    end

    it 'renders when provided via slot' do
      render_inline(described_class.new(title:)) do |c|
        c.with_footer { 'Cancel OK' }
      end
      expect(page).to have_css '.modal__footer', text: 'Cancel OK'
    end

    context 'footer_alignment' do
      it "adds modal__footer--start when 'start'" do
        render_inline(described_class.new(title:, footer_alignment: 'start')) do |c|
          c.with_footer { 'Footer' }
        end
        expect(page).to have_css '.modal__footer.modal__footer--start'
      end

      it "adds modal__footer--center when 'center'" do
        render_inline(described_class.new(title:, footer_alignment: 'center')) do |c|
          c.with_footer { 'Footer' }
        end
        expect(page).to have_css '.modal__footer.modal__footer--center'
      end

      it "adds modal__footer--end when 'end' (default)" do
        render_inline(described_class.new(title:, footer_alignment: 'end')) do |c|
          c.with_footer { 'Footer' }
        end
        expect(page).to have_css '.modal__footer.modal__footer--end'
      end

      it "adds modal__footer--space-between when 'space-between'" do
        render_inline(described_class.new(title:, footer_alignment: 'space-between')) do |c|
          c.with_footer { 'Footer' }
        end
        expect(page).to have_css '.modal__footer.modal__footer--space-between'
      end

      it 'raises InvalidValueError on invalid alignment (raises in local/test env, fallbacks in production)' do
        expect do
          described_class.new(title:, footer_alignment: 'invalid')
        end.to raise_error(Essence::FetchOrFallbackHelper::InvalidValueError)
      end
    end
  end
end

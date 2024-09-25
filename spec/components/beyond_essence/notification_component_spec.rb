# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BeyondEssence::NotificationComponent, type: :component do
  let(:variant_icon) do
    {
      success: 'circle_check',
      info: 'circle_info',
      warning: 'circle_exclamation',
      danger: 'circle_xmark'
    }
  end

  [:success, :info, :warning, :danger].each do |variant|
    context "with `variant: :#{variant}`" do
      include_examples 'notification component', variant do
        let(:icon) { variant_icon[variant] }
      end
    end
  end
end

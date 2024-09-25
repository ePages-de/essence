# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BeyondEssence::ButtonComponent, type: :component do
  [:primary, :secondary, :danger, :outline].each do |variant|
    context "with `variant: :#{variant}`" do
      include_examples 'button component', variant
    end
  end
end

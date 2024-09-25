# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BeyondEssence::LinkComponent, type: :component do
  [:primary, :secondary, :danger].each do |variant|
    context "with `variant: :#{variant}`" do
      include_examples 'link component', variant
    end
  end
end

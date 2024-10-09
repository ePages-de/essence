# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Essence::StatusComponent, type: :component do
  [:outline, :todo, :active, :danger].each do |variant|
    context "with `variant: :#{variant}`" do
      include_examples 'status component', variant
    end
  end
end

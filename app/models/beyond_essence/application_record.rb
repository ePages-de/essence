# frozen_string_literal: true

module BeyondEssence
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end

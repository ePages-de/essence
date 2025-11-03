# frozen_string_literal: true

require 'essence/version'
require 'essence/engine'

module Essence
  mattr_accessor :importmap, default: Importmap::Map.new
end

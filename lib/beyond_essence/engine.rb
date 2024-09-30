# frozen_string_literal: true

module BeyondEssence
  class Engine < ::Rails::Engine
    isolate_namespace BeyondEssence

    config.autoload_paths = [
      "#{root}/lib"
    ]
  end
end

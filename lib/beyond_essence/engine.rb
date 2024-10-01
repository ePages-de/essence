# frozen_string_literal: true

module BeyondEssence
  class Engine < ::Rails::Engine
    isolate_namespace BeyondEssence

    config.autoload_paths = [
      "#{root}/lib"
    ]

    initializer 'beyond_essence.assets' do |app|
      app.config.assets.paths << root.join('app/javascript')
      app.config.assets.paths << root.join('app/components')
      app.config.assets.paths << root.join('vendor/javascript')
      app.config.assets.precompile += ['beyond_essence_manifest']
    end

    initializer 'beyond_essence.importmap', before: 'importmap' do |app|
      app.config.importmap.paths << root.join('config/importmap.rb')
      app.config.importmap.cache_sweepers << root.join('app/javascript')
    end
  end
end

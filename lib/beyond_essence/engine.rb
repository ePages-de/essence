# frozen_string_literal: true

require 'country_select'
require 'gretel'
require 'importmap-rails'
require 'inline_svg'
require 'sassc-rails'
require 'simple_form'
require 'stimulus-rails'
require 'view_component'

module BeyondEssence
  class Engine < ::Rails::Engine
    isolate_namespace BeyondEssence

    config.autoload_paths = [
      "#{root}/lib"
    ]

    config.generators.test_framework = :rspec

    config.view_component.generate.sidecar             = true
    config.view_component.generate.stimulus_controller = true
    config.view_component.generate.locale              = true
    config.view_component.generate.preview             = true
    config.view_component.preview_paths               << root.join('spec/components/previews')
    config.view_component.component_parent_class       = 'ApplicationComponent'

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

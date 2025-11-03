# frozen_string_literal: true

require 'country_select'
require 'gretel'
require 'importmap-rails'
require 'inline_svg'
require 'simple_form'
require 'stimulus-rails'
require 'turbo-rails'
require 'view_component'

module Essence
  class Engine < ::Rails::Engine
    isolate_namespace Essence

    config.autoload_paths = [
      "#{root}/lib"
    ]

    config.generators.test_framework = :rspec

    config.view_component.generate.sidecar             = true
    config.view_component.generate.stimulus_controller = true
    config.view_component.generate.locale              = true
    config.view_component.generate.preview             = true
    config.view_component.preview_paths               << root.join('site/app/previews')
    config.view_component.component_parent_class       = 'ApplicationComponent'

    initializer 'essence.add_default_flash_types' do
      ActiveSupport.on_load(:action_controller_base) do
        add_flash_types(*NotificationComponent::VARIANT_OPTIONS)
      end
    end

    initializer 'essence.assets' do |app|
      app.config.assets.paths << root.join('app/javascript')
      app.config.assets.paths << root.join('app/components')
      app.config.assets.paths << root.join('vendor/javascript')
    end

    initializer 'essence.importmap', after: 'importmap' do |app|
      Essence.importmap.draw(app.root.join('config/importmap.rb'))
      Essence.importmap.draw(root.join('config/importmap.rb'))

      if app.config.importmap.sweep_cache && app.config.reloading_enabled?
        Essence.importmap.cache_sweeper(watches: [app.root.join('app/javascript'),
                                                  root.join('app/javascript'),
                                                  root.join('app/components')])

        ActiveSupport.on_load(:action_controller_base) do
          before_action { Essence.importmap.cache_sweeper.execute_if_updated }
        end
      end
    end
  end
end

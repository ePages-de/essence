# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Site
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f

    # For compatibility with applications that use this config
    config.action_controller.include_all_helpers = false

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: ['assets', 'tasks'])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    if config.respond_to?(:lookbook)
      asset_panel_config = {
        label: 'Assets',
        partial: 'lookbook/panels/assets',
        locals: lambda do |data|
          assets = data.preview.components.flat_map do |component|
            asset_files = Dir[BeyondEssence::Engine.root.join('app/components',
                                                              "#{component.relative_file_path.to_s.chomp('.rb')}/*.{scss,js}")]
            asset_files.map do |path_str|
              path = Pathname(path_str)
              { path:, language: path.extname.delete('.') }
            end
          end

          { assets: }
        end
      }
      Lookbook.define_panel('assets', asset_panel_config)

      config.lookbook.project_name                     = "Beyond Essence v#{BeyondEssence::VERSION}"
      config.lookbook.component_paths                  = [BeyondEssence::Engine.root.join('app/components')]
      config.lookbook.preview_paths                    = [BeyondEssence::Engine.root.join('spec/components/previews')]
      config.lookbook.preview_inspector.drawer_panels  = [:params, :source, :assets]
      config.lookbook.preview_embeds.policy            = 'ALLOWALL'
    end
  end
end

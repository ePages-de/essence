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
      def fetch_asset_files(data)
        data.preview.components.flat_map do |component|
          Dir[Essence::Engine.root.join('app/components',
                                        "#{component.relative_file_path.to_s.chomp('.rb')}/*.{scss,js}")]
        end
      end

      Lookbook.add_panel(
        'assets',
        label: 'Assets',
        partial: 'lookbook/panels/assets',
        hotkey: 'a',
        disabled: ->(data) { fetch_asset_files(data).empty? },
        locals: lambda do |data|
          assets = fetch_asset_files(data).map do |path_str|
            path = Pathname(path_str)
            { path:, language: path.extname.delete('.') }
          end

          { assets: }
        end
      )

      config.lookbook.project_name                     = "Essence v#{Essence::VERSION}"
      config.lookbook.component_paths                  = [Essence::Engine.root.join('app/components')]
      config.lookbook.preview_paths                    = [Rails.root.join('app/previews')]
      config.lookbook.preview_inspector.drawer_panels  = [:params, :source, :assets]
      config.lookbook.preview_embeds.policy            = 'ALLOWALL'
      config.view_component.default_preview_layout     = 'lookbook'
      config.lookbook.preview_display_options          = {
        wrapper: [
          'background',
          'card'
        ]
      }
    end
  end
end

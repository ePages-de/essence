# frozen_string_literal: true

require_relative 'lib/essence/version'

Gem::Specification.new do |spec|
  spec.name        = 'epages-essence'
  spec.version     = Essence::VERSION
  spec.authors     = [
    'Unai Abrisketa',
    'Kenneth Gallego',
    'Kathia Andrea Salazar',
    'Andres Bernardi'
  ]
  spec.email = [
    'uabrisketa@epages.com',
    'kgallego@epages.com',
    'ksalazar@epages.com',
    'abernardi@epages.com'
  ]
  spec.homepage    = 'https://github.com/ePages-de/essence'
  spec.summary     = "ViewComponents for ePages's online shop software Beyond"
  spec.description = <<-DESC
    Essence is an open-source framework that provides ViewComponents,
    form styles and other functionality for apps designed and developed for the
    online shop software Beyond
  DESC
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host']     = 'https://rubygems.org'
  spec.metadata['homepage_uri']          = spec.homepage
  spec.metadata['source_code_uri']       = 'https://github.com/ePages-de/essence'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,lib,vendor}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  end

  spec.required_ruby_version = '>= 3.3'

  spec.add_dependency 'country_select',  '~> 10.0'
  spec.add_dependency 'gretel',          '~> 5.0'
  spec.add_dependency 'importmap-rails', '~> 2.0'
  spec.add_dependency 'inline_svg',      '~> 1.10'
  spec.add_dependency 'rails',           '>= 7.2.2', '< 8.0'
  spec.add_dependency 'sassc-rails',     '~> 2.1'
  spec.add_dependency 'simple_form',     '~> 5.3'
  spec.add_dependency 'stimulus-rails',  '~> 1.3'
  spec.add_dependency 'view_component',  '~> 3.17'
end

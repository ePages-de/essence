# frozen_string_literal: true

pin 'essence/application', to: 'essence/application.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from Essence::Engine.root.join('app/components'), under: 'components', to: ''
pin '@floating-ui/dom', to: '@floating-ui--dom.js' # @1.6.11
pin '@floating-ui/core', to: '@floating-ui--core.js' # @1.6.8
pin '@floating-ui/utils', to: '@floating-ui--utils.js' # @0.2.8
pin '@floating-ui/utils/dom', to: '@floating-ui--utils--dom.js' # @0.2.8
pin 'scroll-shadow-element' # @2.0.5

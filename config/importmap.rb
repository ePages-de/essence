# frozen_string_literal: true

pin 'beyond_essence/application', to: 'beyond_essence/application.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from BeyondEssence::Engine.root.join('app/javascript/beyond_essence/controllers'), under: 'controllers',
                                                                                           to: 'beyond_essence/controllers'

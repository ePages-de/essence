# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  # @display wrapper card
  #
  class StepListComponentPreview < ViewComponent::Preview
    def default(title: 'How to Access a Website')
      render Essence::StepListComponent.new(title:) do |step_list|
        step_list.with_items([
                               {
                                 headline: 'Establish a Connection',
                                 description: 'Connect your device to Wi-Fi or Ethernet and verify by opening a website.'
                               },
                               {
                                 headline: 'Launch Your Browser',
                                 description: 'Open your browser (e.g., Chrome, Firefox) and ensure it\'s up to date.'
                               },
                               {
                                 headline: 'Enter the URL',
                                 description: 'Type the website URL in the address bar and press "Enter".'
                               }
                             ])
      end
    end
  end
end

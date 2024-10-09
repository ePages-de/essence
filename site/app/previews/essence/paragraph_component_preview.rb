# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  # @display wrapper card
  #
  class ParagraphComponentPreview < ViewComponent::Preview
    def default
      html_content = <<~HTML
        <p>
          Your website is currently reachable by your visitors via a free domain (website address). In order to make it easier for your visitors to find and remember your website, it is recommended to use your own custom domain.
        </p>
        <p>
          Connecting your custom domain is easy. Follow the steps below to set up a unique custom domain for your website.
        </p>
        <p>
          Need more detailed instructions regarding custom domains? Learn more in the <a href="#" target="_blank">Help Center</a>
        </p>
        <ol>
          <li>Element 1</li>
          <li>Element 2</li>
          <li>Element 3</li>
        </ol>
        <ul>
          <li>Element 1</li>
          <li>Element 2</li>
          <li>Element 3</li>
        </ul>
      HTML

      render Essence::ParagraphComponent.new do
        html_content.html_safe
      end
    end
  end
end

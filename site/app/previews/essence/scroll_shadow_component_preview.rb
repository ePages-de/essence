# frozen_string_literal: true

module Essence
  #
  # @logical_path components
  #
  # @display wrapper card
  #
  class ScrollShadowComponentPreview < ViewComponent::Preview
    def vertical
      html_content = <<~HTML
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
          Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<br>
          Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.<br>
          Nisi ut aliquip ex ea commodo consequat.<br>
          Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.<br>
          Eu fugiat nulla pariatur.<br>
          Excepteur sint occaecat cupidatat non proident.<br>
          Sunt in culpa qui officia deserunt mollit anim id est laborum.<br>
          Curabitur pretium tincidunt lacus.<br>
          Nulla gravida orci a odio.<br>
          Nullam varius, turpis et commodo pharetra.<br>
          Est eros bibendum elit, nec luctus magna felis sollicitudin mauris.<br>
          Integer in mauris eu nibh euismod gravida.<br>
          Duis ac tellus et risus vulputate vehicula.<br>
          Donec lobortis risus a elit.
        </p>
      HTML

      render Essence::ScrollShadowComponent.new(style: 'max-height: 100px') do
        html_content.html_safe
      end
    end

    def horizontal
      html_content = <<~HTML
        <table border="1">
          <thead>
            <tr>
              <th>Column 1</th>
              <th>Column 2</th>
              <th>Column 3</th>
              <th>Column 4</th>
              <th>Column 5</th>
              <th>Column 6</th>
              <th>Column 7</th>
              <th>Column 8</th>
              <th>Column 9</th>
              <th>Column 10</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Row 1 Data 1</td>
              <td>Row 1 Data 2</td>
              <td>Row 1 Data 3</td>
              <td>Row 1 Data 4</td>
              <td>Row 1 Data 5</td>
              <td>Row 1 Data 6</td>
              <td>Row 1 Data 7</td>
              <td>Row 1 Data 8</td>
              <td>Row 1 Data 9</td>
              <td>Row 1 Data 10</td>
            </tr>
            <tr>
              <td>Row 2 Data 1</td>
              <td>Row 2 Data 2</td>
              <td>Row 2 Data 3</td>
              <td>Row 2 Data 4</td>
              <td>Row 2 Data 5</td>
              <td>Row 2 Data 6</td>
              <td>Row 2 Data 7</td>
              <td>Row 2 Data 8</td>
              <td>Row 2 Data 9</td>
              <td>Row 2 Data 10</td>
            </tr>
          </tbody>
        </table>
      HTML

      render Essence::ScrollShadowComponent.new(style: 'max-width: 400px') do
        html_content.html_safe
      end
    end
  end
end

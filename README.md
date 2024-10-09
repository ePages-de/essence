# Essence

![Gem Version](https://img.shields.io/gem/v/epages-essence)
![License](https://img.shields.io/github/license/ePages-de/essence)

## Installation

1. Add this line to your application's Gemfile:

    ```ruby
    gem 'epages-essence'
    ```

1. Execute the following command:

    ```bash
    bundle install
    ```

1. Add the following lines to the `<head>` and `<body>` of the layout you are going to use (e.g. `app/views/layouts/application.html.erb`):

    ```erb
    <!DOCTYPE html>
    <html>
      <head>
        <%= stylesheet_link_tag 'essence/beyond', 'data-turbo-track': 'reload' %>
        <%= javascript_importmap_tags 'essence/application' %>
        <%= yield :head %>
      </head>

      <body>
        <%= render template: 'essence/beyond/body' %>
      </body>
    </html>
    ```

    > Any `javascript_import_module_tag` must come after the `javascript_importmap_tags` declaration, that's why `<%= yield :head %>` is placed after this declaration. See [`importmap-rails` gem](https://github.com/rails/importmap-rails?tab=readme-ov-file#selectively-importing-modules).

## Component preview

Essence includes a Rails application that uses [Lookbook](https://lookbook.build/). By running this app, you can preview the components and explore the possibilities that Essence offers.

> Currently, the Lookbook app is in an early stage and is still under development. It does not have a preview of all the components but of most of them.

To run the Lookbook app, follow these steps:

1. Change directory to `site`, which is the Lookbook project's folder:

    ```bash
    cd site
    ```

2. Start the web server:

    ```bash
    bin/rails server
    ```

## Contributing

Please see [CONTRIBUTING](https://github.com/ePages-de/essence/blob/main/CONTRIBUTING.md).

## License

Essence is Copyright © 2024 ePages GmbH. It is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/ePages-de/essence/blob/main/LICENSE) file.

## About ePages

As the largest independent provider of online shop software in Europe, ePages specialises in high-performance ecommerce solutions for small and medium-sized businesses.
Today, 100,000 companies in 70 countries operate professional online shops with ePages software in the cloud.

And we love open source software!
Check out our [other projects](https://github.com/ePages-de), or [become part of our team](https://developer.epages.com/devjobs/) and develop great ecommerce software with us!

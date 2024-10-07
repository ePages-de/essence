# Beyond Essence

![Gem Version](https://img.shields.io/gem/v/beyond_essence)
![License](https://img.shields.io/github/license/ePages-de/beyond_essence)

## Installation

1. Add this line to your application's Gemfile:

    ```ruby
    gem 'beyond_essence'
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
        <%= stylesheet_link_tag 'beyond_essence/application', 'data-turbo-track': 'reload' %>
        <%= javascript_importmap_tags 'beyond_essence/application' %>
        <%= yield :head %>
      </head>

      <body>
        <%= render template: 'beyond_essence/body' %>
      </body>
    </html>
    ```

    > [!IMPORTANT]
    > Any `javascript_import_module_tag` should come after `javascript_importmap_tags` declaration, that's why `<%= yield :head %>` is added after.

## Component preview

Beyond Essence comes with a Rails application that uses [Lookbook](https://lookbook.build/). By running it you can preview the components and see possibilities that Beyond Essence offers.

> [!NOTE]
> Currently, the Lookbook app is in an early stage and is still under development. It does not have a preview of all the components but of most of them.

To run the Lookbook app, follow these steps:

1. Change directory to `site`, the Lookbook project's folder:

    ```bash
    cd site
    ```

2. Start the web server:

    ```bash
    bin/rails server
    ```

## Contributing

Please see [CONTRIBUTING](https://github.com/ePages-de/beyond_essence/blob/main/CONTRIBUTING.md).

## License

Beyond Essence is Copyright © 2024 ePages GmbH. It is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/ePages-de/beyond_essence/blob/main/LICENSE) file.

## About ePages

As the largest independent provider of online shop software in Europe, ePages specialises in high-performance ecommerce solutions for small and medium-sized businesses.
Today, 100,000 companies in 70 countries operate professional online shops with ePages software in the cloud.

And we love open source software!
Check out our [other projects](https://github.com/ePages-de), or [become part of our team](https://developer.epages.com/devjobs/) and develop great ecommerce software with us!

# Agent Guide

Essence is a Rails 8 engine that ships Beyond UI as ViewComponents with Stimulus/Turbo; Lookbook preview lives in `site/`.

Stack quickref
- Ruby >= 3.3 with Bundler
- ViewComponent + SimpleForm; importmap + Propshaft assets; Stimulus controllers in `app/javascript/essence/controllers`
- Components in `app/components/essence`; styles/images under `app/assets/essence`

Setup
- `bundle install`
- Preview app: `cd site && bin/setup --skip-server` to install deps and prep the sqlite DB
- Start Lookbook: `cd site && bin/rails server` (or run `site/bin/setup` without `--skip-server` to boot via `bin/dev`)

Everyday dev
- Subclass `Essence::ApplicationComponent`; pair `*_component.rb` with `*_component.html.erb`
- JS entry: `app/javascript/essence/application.js`; register controllers via `controllers/index.js`; add importmap pins in `config/importmap.rb` when needed
- CSS/design tokens in `app/assets/stylesheets/essence`; images in `app/assets/images/essence`
- Previews/examples live in `site/app/previews/**`; mirror new props and states there
- Shared helpers and form inputs are under `app/helpers` and `app/inputs`; reuse existing utilities before adding new ones

Quality gates
- Specs: `bundle exec rspec`
- Lint: `bundle exec rubocop`
- Security: `bundle exec brakeman`
- Gem sanity: `bundle exec rake build` (bundler gem tasks)

Notes for changes
- Keep HTML semantics and ARIA intact; components are consumed by storefront apps
- Avoid bundling external JS/CSS; rely on importmap + Stimulus
- Preserve backward compatibility; prefer deprecations to breaking changes
- Update previews and documentation when behaviour or UI shifts

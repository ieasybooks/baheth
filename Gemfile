source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

# Project specific gems:

# CSS framework for the project.
gem 'bootstrap', '~> 5.2', '>= 5.2.3'

# Custom form builder to simplify Rails forms creation process.
gem 'simple_form', '~> 5.2'

# Flexible authentication solution for Rails based on Warden.
gem 'devise', '~> 4.9'

# Translate Devise messages/views into Arabic.
gem 'devise-i18n', '~> 1.9', '>= 1.9.2'

# Authorization solution for Rails.
gem 'cancancan', '~> 3.4'

# Pagination for Rails ActiveRecord (And other Ruby frameworks/code).
gem 'pagy', '~> 6.0', '>= 6.0.2'

# Tagging engine for Rails to add tags to models easily.
gem 'acts-as-taggable-on', '~> 9.0', '>= 9.0.1'

# The search engine used in the application.
gem 'meilisearch-rails', '~> 0.8.1'

# Ruby gem for parsing .srt (subtitle) files.
gem 'srt', '~> 0.1.5'

# Rails engine for cache-friendly, client-side local time.
gem 'local_time', '~> 2.1'

# Library for validating urls in Rails.
gem 'validate_url', '~> 1.0', '>= 1.0.15'

# The fastest JSON parser and object serializer.
gem 'oj', '~> 3.14', '>= 3.14.2'

group :development do
  # Lint ERB files, "ERB Linter" VSCode extension is required.
  gem 'erb_lint'

  # Format, analyze, and fix code formatting issues.
  gem 'rubocop'

  # RuboCop extension specified for Rails projects.
  gem 'rubocop-rails'

  # Code style checking for Capybara test files.
  gem 'rubocop-capybara'

  # IDE tools for code completion, inline documentation, and static analysis.
  gem 'solargraph'

  # Help to kill N+1 queries and unused eager loading.
  gem 'bullet'

  # Easily generate fake data.
  gem 'faker'
end

# Default Rails gems:

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
gem 'sassc-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

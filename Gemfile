source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'carrierwave', '~> 2.0'
gem 'mini_magick'

gem 'devise'
gem 'omniauth-github', '~> 2.0.0', '>= 2.0.0'
gem 'omniauth-rails_csrf_protection', '~> 1.0.0'
gem 'pundit'

gem 'pagy', '~> 4.10', '>= 4.10.1'

gem 'open-uri', '~> 0.1.0'
gem 'rss', '~> 0.2.8'

gem 'sidekiq', '~> 4.1', '>= 4.1.2'
gem 'sidekiq-cron', '~> 0.4.2'

gem 'chartkick', '~> 4.0', '>= 4.0.5'
gem 'groupdate', '~> 5.2', '>= 5.2.2'

gem 'elasticsearch-model', '~> 7.2', '>= 7.2.0'
gem 'elasticsearch-rails', '~> 7.2', '>= 7.2.0'

gem 'wicked_pdf', '~> 2.1', '>= 2.1.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot', '~> 6.2', '>= 6.2.0'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'letter_opener', '~> 1.7', '>= 1.7.0'
  gem 'rack-mini-profiler', '~> 2.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', '~> 0.21', '>= 0.21.2'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

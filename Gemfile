source 'https://rubygems.org'
ruby '2.2.2'

gem 'padrino', '0.12.5'

# Optional JSON codec (faster performance)
# gem 'oj'

# Server requirements
gem 'puma'

# Project requirements
gem 'rake'

# Component requirements
gem 'carrierwave'
gem 'activerecord', '>= 3.1', :require => 'active_record'
gem 'pg'
gem 'sass'
gem 'slim'

# API requirements
gem 'grape'
gem 'hashie-forbidden_attributes'
gem 'padrino-grape', github: 'adamluzsi/padrino-grape'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.12.5'
# end
group :development, :test do
  gem 'factory_girl'
  gem 'faker'
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec'
  gem 'rack-test', require: 'rack/test'
  gem 'shoulda-matchers'

  # API support
  gem 'airborne'
end

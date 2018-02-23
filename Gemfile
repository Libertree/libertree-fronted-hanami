source 'https://rubygems.org'

gem 'bcrypt', '~> 3.1.11'
gem 'hanami', '~> 1.1'
gem 'i18n', '~> 1.0.0'
gem 'libertree-model', git: 'git://github.com/Libertree/libertree-model-rb.git', branch: 'vue-js'
gem 'pg', '~> 1.0.0'
gem 'rake', '~> 12.3.0'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', '~> 0.9.2'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'pry', '~> 0.11.3'
end

group :test do
  gem 'capybara', '~> 2.18.0'
  gem 'database_cleaner', '~> 1.6.2'
  gem 'factory_bot', '~> 4.8.2'
  gem 'rspec', '~> 3.7.0'
end

group :production do
  # gem 'puma'
end

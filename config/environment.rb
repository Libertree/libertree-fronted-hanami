require 'bundler/setup'
require 'hanami/setup'
require_relative '../apps/web/application'
require_relative './initializers/locale.rb'

Hanami.configure do
  mount Web::Application, at: '/'

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []
  end
end

Libertree::Model::Account.set_auth_settings(:default, nil)

require 'bundler/setup'

########################
# FIXME: Sequel wants us to connect to the db before defining models.  As model
# definitions are loaded when 'libertree/model' is required, we have to do
# this first.
require 'libertree/db'
Libertree::DB.load_config "#{File.dirname( __FILE__ ) }/database.yaml"
Libertree::DB.dbh
########################

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

$conf = YAML.load( File.read(Hanami.root.join("config/application.yaml")) )
$conf['websocket_blacklist'] ||= []
ENV['RACK_ENV'] = $conf['environment'] || 'live'

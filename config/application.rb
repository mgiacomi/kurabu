require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kurabu
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    ENV['SSL_CERT_FILE'] = File.expand_path(File.dirname(__FILE__)) + "/cacert.pem"
    #ENV['GOOGLE_APPLICATION_CREDENTIALS'] = File.expand_path(File.dirname(__FILE__)) + '/kurabu_key.json'
  end
end

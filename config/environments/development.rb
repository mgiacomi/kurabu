Rails.application.configure do
  ENV['KURABU_KEY'] = File.read('/opendev/scripts/kurabu_key.json')
  config.url_enc_base = "4c71e197be9d616cc42f2d8dc1de76bb6bcc3ca128073e32353672282a37d219972e343457520a5a54004c6a8699285f807447ed7365a05526d5b05cb48b1c8c"

  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  ActionMailer::Base.smtp_settings = {
      :address              => "mail.oyanokai.org",
      :port                 => 587,
      :domain               => "oyanokai.org",
      :user_name            => "no-reply@oyanokai.org",
      :password             => "",
      :authentication       => "plain",
      :enable_starttls_auto => true,
      :openssl_verify_mode  => 'none'
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

end

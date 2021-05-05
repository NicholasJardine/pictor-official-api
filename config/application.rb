require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PictorOfficialApi
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
      config.load_defaults 5.2
      config.api_only = true
      config.middleware.use ActionDispatch::Flash

      config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins '*'
          resource(
            '*',
            headers: :any,
            methods: [:get, :patch, :put, :delete, :post, :options]
            )
        end
      end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

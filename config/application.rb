require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SystemGui
  class Application < Rails::Application

    config.autoload_paths << "#{Rails.root}/lib"

    config.after_initialize do
      setup_engines_library
      monitor_container_events
      # monitor_builder_events
    end

    def setup_engines_library
      Systems::Library.first_or_create(
          name: 'Engines library',
          url: 'https://engineslibrary.engines.onl/api/v0/software' )
    rescue
      # Rescue so that application can start without database for first migrateion.
    end

    # def monitor_system_events
    #
    # end

    def monitor_container_events
      Thread.new do
        loop do
          Rails.logger.warn 'Open connection to Engines container events.'
          ContainerEventsListenerJob.perform_now
          Rails.logger.warn 'Close connection to Engines container events.'
          sleep 1
        end
      end
    end





    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

  end
end

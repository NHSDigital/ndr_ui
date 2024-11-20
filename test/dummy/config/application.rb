require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require 'ndr_ui'

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults Rails.version.match(/[0-9]*[.][0-9]*/).to_s # e.g. 7.2

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

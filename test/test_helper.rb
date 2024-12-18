require 'simplecov'
SimpleCov.start

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../test/dummy/config/environment.rb', __FILE__)
require 'rails/test_help'

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path('../fixtures', __FILE__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.fixtures :all
end

# Include all capybara + poltergeist config
ENV['INTEGRATION_DRIVER'] ||= 'chrome_headless'
require 'ndr_dev_support/integration_testing'

Capybara.server = :puma, { Silent: true }

module ActiveSupport
  class TestCase
    def unsafe_string
      '<script type="text/javascript">alert(\'UNSAFE!\');</script>'
    end
  end
end

module ActionView
  class TestCase
    def reset_output_buffer!
      @output_buffer = ActionView::OutputBuffer.new
    end
  end
end

require 'mocha/minitest'

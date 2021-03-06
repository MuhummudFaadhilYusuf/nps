ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require 'webmock/minitest'
require 'simplecov'
SimpleCov.start

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers

  VCR.configure do |config|
    config.cassette_library_dir = 'test/vcr_cassette'
    config.hook_into :webmock
  end
end

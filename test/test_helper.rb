require 'simplecov'
SimpleCov.start 'rails'

require 'simplecov-formatter-badge'
SimpleCov.formatter =
  SimpleCov::Formatter::MultiFormatter.new \
    [SimpleCov::Formatter::HTMLFormatter,
     SimpleCov::Formatter::BadgeFormatter]

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

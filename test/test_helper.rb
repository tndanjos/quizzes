ENV["RAILS_ENV"] ||= "test"

require_relative "../config/environment"

require "rails/test_help"
require "database_cleaner/active_record"

DatabaseCleaner.strategy = :transaction

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors)

    setup do
      DatabaseCleaner.start
    end

    teardown do
      DatabaseCleaner.clean
    end
  end
end

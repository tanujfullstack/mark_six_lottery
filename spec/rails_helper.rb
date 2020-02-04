# frozen_string_literal: true

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'database_cleaner'
require 'faker'

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.clean
  end

  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f}

  config.include(Shoulda::Callback::Matchers::ActiveModel)

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end

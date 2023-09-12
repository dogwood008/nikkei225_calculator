# frozen_string_literal: true

require 'nikkei225_calculator'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

module ::RSpec
  module_function
  def root
    @spec_root ||= Pathname.new(__dir__)
  end
end
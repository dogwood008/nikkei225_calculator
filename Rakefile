# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'

RuboCop::RakeTask.new

task default: %i[spec rubocop]

namespace :type do
  task :typing do
    sh 'bundle exec typeprof lib/nikkei225_calculator.rb'
  end

  task :check do
    sh 'bundle exec steep check'
  end
end
# frozen_string_literal: true

require 'bundler/setup'
require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

require 'rubocop/rake_task'
RuboCop::RakeTask.new

task default: %i[spec rubocop]

begin
  require 'yard'

  YARD::Rake::YardocTask.new
rescue LoadError => e
  task :yard do
    warn e.message
  end
end
task doc: 'yard'

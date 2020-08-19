# frozen_string_literal: true

require 'jsonlint/rake_task'

desc 'Run rubocop > fasterer > rspec (only if previous succeed)'
task :validate_app do
  if system 'rubocop'
    system 'rspec' if system 'fasterer'
  end
end

desc 'validate json schemas'
task :validate_json_schemas do
  system 'jsonlint spec/support/api/schemas/*.json'
end

# frozen_string_literal: true

require 'jsonlint/rake_task'

desc 'Run rubocop > jsonlinter > fasterer > rspec (only if previous succeed)'
task :validate do
  if system 'rubocop' && RAkeTask[':validate_json_schemas'].invoke
    system 'rspec' if system 'fasterer'
  end
end

desc 'validate json schemas'
task :validate_json_schemas do
  system 'jsonlint spec/support/api/schemas/*.json'
end

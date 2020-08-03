# frozen_string_literal: true

desc 'Run rubocop > fasterer > rspec (only if previous succeed)'
task :validate do
  if system 'rubocop'
    system 'rspec' if system 'fasterer'
  end
end

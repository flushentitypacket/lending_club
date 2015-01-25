require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "test/**/*_test.rb"
end

desc "Start console with credentials auto-loaded from config/credentials.yml"
task :console do
  require 'irb'
  require 'irb/completion'
  require 'lending_club'
  require 'yaml'
  YAML.load(File.read('config/credentials.yml')).tap do |credentials|
    LendingClub.access_token = credentials['access_token']
    LendingClub.investor_id = credentials['investor_id']
  end
  ARGV.clear
  IRB.start
end

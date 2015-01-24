require "bundler/gem_tasks"

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

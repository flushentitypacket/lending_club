require 'lending_club'
require 'minitest/autorun'

require 'minitest/reporters'
reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

def fixture(file)
  File.new(File.expand_path("../fixtures", __FILE__) + '/' + file)
end

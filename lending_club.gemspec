# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lending_club/version'

Gem::Specification.new do |spec|
  spec.name = "lending_club"
  spec.version = LendingClub::VERSION
  spec.authors = ["Ronald Hong"]
  spec.email = ["ronniejhong@gmail.com"]
  spec.summary = %q{Ruby wrapper for the Lending Club API.}
  spec.post_install_message = ""
  spec.homepage = "https://github.com/flushentitypacket/lending_club"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency('faraday', '~> 0.9')
  spec.add_runtime_dependency('faraday_middleware', '~> 0.9')
end

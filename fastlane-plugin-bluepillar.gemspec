# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/bluepillar/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-bluepillar'
  spec.version       = Fastlane::Bluepillar::VERSION
  spec.author        = %q{Shashikant86}
  spec.email         = %q{shashikant.jagtap@icloud.com}

  spec.summary       = %q{Fastlane Plugin to Run XCUITests in Parallel using Bluepill.}
  # spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-bluepillar"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 2.26.1'
end

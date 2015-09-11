# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dashing_resque/version'

Gem::Specification.new do |spec|
  spec.name          = 'dashing_resque'
  spec.version       = DashingResque::VERSION
  spec.authors       = ['Wer liefert was? GmbH Developers']
  spec.email         = ['web-devs@wlw.de']

  spec.summary       = 'Provides resque jobs/widgets for Dashing'
  spec.description   = 'Provides resque jobs/widgets for Dashing'
  spec.homepage      = 'https://github.com/werliefertwas/dashing_resque'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'resque'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'pry-coolline'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'ruby_gntp'
end

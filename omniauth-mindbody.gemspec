# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/mindbody/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-mindbody"
  gem.version       = OmniAuth::Mindbody::VERSION
  gem.authors       = ["Stafford Brunk"]
  gem.email         = ["stafford.brunk@gmail.com"]
  gem.description   = %q{OmniAuth strategy for the MindBody API version 0.5.x}
  gem.summary       = %q{OmniAuth strategy for the MindBody API}
  gem.homepage      = "https://github.com/wingrunr21/omniauth-mindbody"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'mindbody-api', '~> 0.5'

  gem.add_development_dependency 'bundler', '~> 1.3'
  gem.add_development_dependency "rake"
  gem.add_development_dependency 'rspec', '~> 2.13'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'semaphore-api/version'

Gem::Specification.new do |gem|
  gem.name          = "semaphore-api"
  gem.version       = Semaphore::Api::VERSION
  gem.authors       = ["Jon Moses"]
  gem.email         = ["jon@burningbush.us"]
  gem.description   = %q{Interact with the Semaphore API}
  gem.summary       = %q{Interact with the Semaphore API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'httparty', '~> 0.9.0'
end

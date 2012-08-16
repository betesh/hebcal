# -*- encoding: utf-8 -*-
require File.expand_path('../lib/passover/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Isaac Betesh"]
  gem.email         = ["iybetesh@gmail.com"]
  gem.description   = `cat README.md`
  gem.summary       = 'Determines the date of Passover for a Gregorian year. Determines whether a Gregorian date is a Jewish holiday.'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "passover"
  gem.require_paths = ["lib"]
  gem.version       = Passover::VERSION
  gem.license       = 'MIT'
  gem.post_install_message = `cat README.md`
  gem.add_runtime_dependency 'jquery-rails'
end

# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hebcal/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Isaac Betesh"]
  gem.email         = ["iybetesh@gmail.com"]
  gem.description   = `cat README.md`
  gem.summary       = 'Determines the date of Passover for a Gregorian year. Determines whether a Gregorian date is a Jewish holiday.'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "hebcal"
  gem.require_paths = ["lib"]
  gem.version       = HebCal::VERSION
  gem.license       = 'MIT'
end

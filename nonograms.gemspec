# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nonograms/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michał Szyma"]
  gem.email         = ["raglub.ruby@gmail.com"]
  gem.description   = %q{Solve nonograms.}
  gem.summary       = %q{Solve  nonograms.}
  gem.date          = "2012-06-25"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nonograms"
  gem.require_paths = ["lib"]
  gem.version       = Nonograms::VERSION
end

# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nonograms/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michał Szyma"]
  gem.email         = ["raglub.ruby@gmail.com"]
  gem.description   = %q{solve the puzzle game nonograms.}
  gem.summary       = %q{Solve Nonograms.}
  gem.date          = "2012-07-03"
  gem.homepage      = "https://github.com/raglub/nonograms"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nonograms"
  gem.require_paths = ["lib"]
  gem.version       = Nonograms::VERSION
  gem.platform      = Gem::Platform::RUBY

  gem.add_development_dependency "rspec", ">= 2.10.0"
end

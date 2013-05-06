# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rapidftr_addons/version'

Gem::Specification.new do |gem|
  gem.name          = "rapidftr_addons"
  gem.version       = RapidftrAddons::VERSION
  gem.authors       = ["Faris Mohammed"]
  gem.email         = ["farismosman@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "i18n"
  gem.add_dependency "activesupport"

  gem.add_development_dependency "rspec"

end



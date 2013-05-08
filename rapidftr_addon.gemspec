# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rapidftr_addon/version'

Gem::Specification.new do |gem|
  gem.name          = "rapidftr_addon"
  gem.version       = RapidftrAddon::VERSION
  gem.authors       = ["Faris Mohammed"]
  gem.email         = ["farismosman@gmail.com"]
  gem.description   = %q{Collection of interfaces to extend RapidFTR}
  gem.summary       = %q{Collection of interfaces to extend RapidFTR}
  gem.homepage      = "https://github.com/farismosman/rapidftr-addon"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "i18n"
  gem.add_dependency "activesupport"

  gem.add_development_dependency "rspec"

end



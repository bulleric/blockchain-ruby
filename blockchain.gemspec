# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blockchain/version'

Gem::Specification.new do |spec|
  spec.name          = "blockchain-ruby"
  spec.version       = Blockchain::VERSION
  spec.authors       = ["blooberr"]
  spec.email         = ["blooberr@gmail.com"]
  spec.description   = %q{ Ruby wrapper for blockchain api }
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end


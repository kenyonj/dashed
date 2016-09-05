# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dashed/version'

Gem::Specification.new do |spec|
  spec.name          = "dashed"
  spec.version       = Dashed::VERSION
  spec.authors       = ["Justin Kenyon", "Blake Williams", 'Robert Müller']
  spec.email         = ["kenyonj@gmail.com", "blake@blakewilliams.me", 'code@brauser.io']

  spec.summary       = %q{Library for interacting with Amazon Dash buttons}
  spec.description   = %q{Library for interacting with Amazon Dash buttons}
  spec.homepage      = "https://github.com/kenyonj/dashed"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "pcaprub", "~> 0.12.0"
end

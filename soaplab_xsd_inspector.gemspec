# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'soaplab_xsd_inspector/version'

Gem::Specification.new do |spec|
  spec.name          = "soaplab_xsd_inspector"
  spec.version       = SoaplabXsdInspector::VERSION
  spec.authors       = ["Santi Bel"]
  spec.email         = ["santiago.bel@gmail.com"]
  spec.description   = %q{ Parse and inspect XSD files for SOAPLAB Web Services}
  spec.summary       = %q{ Soaplab XSD Inspector parses Web Service Input/Ouput information contained in SOAPLAB XSD files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13"
end

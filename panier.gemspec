# Encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'panier/version'

Gem::Specification.new do |spec|
  spec.name          = 'panier'
  spec.version       = Panier::VERSION
  spec.authors       = ['Luke Eller']
  spec.email         = ['luke.eller@bigcommerce.com']
  spec.summary       = 'A gem demonstrating the calculation of sales taxes.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'money'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'factory_girl'
  spec.add_development_dependency 'faker'
end

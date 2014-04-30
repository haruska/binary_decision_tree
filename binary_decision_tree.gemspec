# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'binary_decision_tree/version'

Gem::Specification.new do |spec|
  spec.name          = "binary_decision_tree"
  spec.version       = BinaryDecisionTree::VERSION
  spec.authors       = ["Jason Haruska"]
  spec.email         = ["jason@haruska.com"]
  spec.summary       = %q{A binary decision tree}
  spec.description   = %q{A binary decision tree useful for brackets of single elimination tournaments.}
  spec.homepage      = "http://github.com/haruska/binary_decision_tree"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
end

# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "sequel-money-fields"
  spec.version       = "0.1.0"
  spec.author        = "Lithic Tech"
  spec.email         = ["hello@lithic.tech"]

  spec.summary       = "Gem for adding money fields to a model"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.2")

  spec.files = ["README.md"] + Dir["{spec,lib}/**/*.rb"]

  spec.add_dependency "monetize"
  spec.add_dependency "money"
  spec.add_dependency "sequel"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "rubocop-sequel"
end

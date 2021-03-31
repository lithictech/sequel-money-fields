# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "sequel_money_fields"
  spec.version       = "0.1.0"
  spec.author        = "Lithic Tech"

  spec.summary       = "Gem for adding money fields to a model."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.2")

  spec.files = ["README.md"] + Dir["{spec,lib}/**/*.rb"]

  spec.add_dependency("monetize")
  spec.add_dependency("money")
  spec.add_dependency("sequel")
  spec.add_development_dependency("rspec")
end

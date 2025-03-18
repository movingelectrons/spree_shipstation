# frozen_string_literal: true

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = "spree_shipstation"
  s.version = "3.0.2"
  s.summary = "Simple support for shipstation for spree"
  s.description = "Built for spree 4.9 (may work with other versions) based on spree_shipstation"
  s.required_ruby_version = ">= 3.3.0"

  s.authors =  "Jerome Stonebridge",
  s.email = "jeromestonebridge@gmail.com"
  s.homepage = "https://github.com/movingelectrons/spree_shipstation"
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.require_path = "lib"
  s.requirements << "none"

  s.add_dependency "spree_core"
  s.add_dependency "spree_api"
  s.add_dependency "spree_backend"
  s.add_dependency "spree_extension"
end

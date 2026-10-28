Gem::Specification.new do |spec|
  spec.name = "test-gem"
  spec.version = "0.1.0"
  spec.summary = "A minimal test gem"
  spec.description = "Used to satisfy the Ruby GitHub Actions workflow in this repository."
  spec.authors = ["carjam120443-netizen"]
  spec.email = ["carjam120443-netizen@example.com"]
  spec.homepage = "https://github.com/carjam120443-netizen/testfiles"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.files = Dir["lib/**/*.rb", "README.md", "LICENSE*"]
end

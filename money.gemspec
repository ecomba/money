Gem::Specification.new do |s|
  s.name        = "ecr_money"
  s.version     = "3.6.6"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alberto Peña", "Enrique Comba Riepenhausen"]
  s.email       = ["ecomba@nexwerk.com", "plagelao@gmail.com"]
  s.homepage    = "http://money.rubyforge.org"
  s.summary     = "Money and currency exchange support library."
  s.description = "This library aids one in handling money and different currencies. Based on the money gem"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "i18n", "~> 0.4"

  s.add_development_dependency "rspec", ">= 2.0.0"
  s.add_development_dependency "yard"
  s.add_development_dependency "json"

  s.requirements << "json if you plan to import/export rates formatted as json"

  s.files        = Dir.glob("lib/**/*") + %w(CHANGELOG.md LICENSE README.md)
  s.require_path = "lib"
end

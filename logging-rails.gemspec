# -*- encoding: utf-8 -*-
# stub: logging-rails 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "logging-rails"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tim Pease"]
  s.date = "2015-03-30"
  s.description = "A Railtie for for integrating the [Logging](https://github.com/TwP/logging)\nframework into your Rails 3 application."
  s.email = "tim.pease@gmail.com"
  s.extra_rdoc_files = ["History.txt", "lib/logging/rails/generators/USAGE", "lib/logging/rails/generators/templates/logging.rb.erb"]
  s.files = [".gitignore", "History.txt", "README.md", "Rakefile", "lib/logging-rails.rb", "lib/logging/rails.rb", "lib/logging/rails/generators/USAGE", "lib/logging/rails/generators/install_generator.rb", "lib/logging/rails/generators/templates/logging.rb.erb", "lib/logging/rails/mixin.rb", "lib/logging/rails/railtie.rb", "script/bootstrap", "version.txt"]
  s.homepage = "http://rubygems.org/gems/logging-rails"
  s.rdoc_options = ["--main", "README.md"]
  s.rubyforge_project = "logging-rails"
  s.rubygems_version = "2.2.2"
  s.summary = "A Railtie for for integrating the [Logging](https://github."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<logging>, [">= 1.8"])
      s.add_development_dependency(%q<bones-git>, ["~> 1.3"])
      s.add_development_dependency(%q<rails>, ["~> 4"])
      s.add_development_dependency(%q<bones>, [">= 3.8.3"])
    else
      s.add_dependency(%q<logging>, [">= 1.8"])
      s.add_dependency(%q<bones-git>, ["~> 1.3"])
      s.add_dependency(%q<rails>, ["~> 4"])
      s.add_dependency(%q<bones>, [">= 3.8.3"])
    end
  else
    s.add_dependency(%q<logging>, [">= 1.8"])
    s.add_dependency(%q<bones-git>, ["~> 1.3"])
    s.add_dependency(%q<rails>, ["~> 4"])
    s.add_dependency(%q<bones>, [">= 3.8.3"])
  end
end

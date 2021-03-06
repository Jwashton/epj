# frozen_string_literal: true

require_relative 'lib/epj/version'

Gem::Specification.new do |spec|
  spec.name          = 'epj'
  spec.version       = Epj::VERSION
  spec.authors       = ['William Ashton']
  spec.email         = ['William@AshtonFam.org']

  spec.summary       = 'Elf Project Journal: Advent of Code Assistant'
  spec.description   = 'Generate and manage code for each advent of code puzzle'
  spec.homepage      = 'https://github.com/jwashton/epj'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.0.2'

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/NAD-ITS/query_assistant/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'thor', '~> 1.1.0'

  spec.add_development_dependency 'aruba', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.23'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.6'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end

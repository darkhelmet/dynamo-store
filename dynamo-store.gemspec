# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dynamo-store/version'
# require "active_support/cache/dynamo_store"

Gem::Specification.new do |spec|
  spec.name          = 'dynamo-store'
  spec.version       = DynamoStore::VERSION
  spec.authors       = ['David Harkness', 'Brian Malinconico']
  spec.email         = ['david.harkness@terminus.com', 'brian.malinconico@terminus.com']

  spec.summary       = 'ActiveSupport Cache Store for DynamoDb'
  spec.description   = 'ActiveSupport Cache Store for DynamoDb'
  spec.homepage      = 'https://github.com/GetTerminus/dynamo-store'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/GetTerminus/dynamo-cache-store.git'
    # spec.metadata["changelog_uri"] = ": Put your gem's CHANGELOG.md URL here."
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '> 5.0'
  spec.add_dependency 'aws-sdk-dynamodb', '> 1.0'
  spec.add_dependency 'rexml'

  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'deep-cover'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-lcov', '~> 0.8.0'
  spec.add_development_dependency 'timecop'
end

# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'hws-stores'
  spec.version       = '0.1.1'
  spec.authors       = ['Hypto Engineering Team']
  spec.email         = ['engineering@hypto.in']

  spec.summary       = 'Experimental store primitive'
  spec.description   = 'Experimental store primitive'
  spec.homepage      = 'https://github.com/hwslabs/hws-stores-ruby'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = 'http://mygemserver.com'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/hwslabs/hws-stores-ruby'
    spec.metadata['changelog_uri'] = 'https://github.com/hwslabs/hws-stores-ruby/blob/main/CHANGELOG.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'json_schemer', '0.2.16'
  spec.add_dependency 'lsuuid', '0.1.0'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
end

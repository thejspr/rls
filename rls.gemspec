# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rls/version'

Gem::Specification.new do |gem|
  gem.name          = 'rls'
  gem.version       = Rls::VERSION
  gem.authors       = ['Jesper Kjeldgaard']
  gem.email         = ['thejspr@gmail.com']
  gem.description   = %q{All in one deploy command for Heroku apps}
  gem.summary       = %q{Heroku deploy wrapper}
  gem.homepage      = 'http://github.com/thejspr/rls'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ['lib']

  gem.add_dependency 'trollop', '~>2.0'

  gem.add_development_dependency 'rspec', '~>2.11'
end

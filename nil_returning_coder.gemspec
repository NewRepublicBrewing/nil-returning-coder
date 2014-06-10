$:.push File.expand_path('../lib', __FILE__)
require 'nil_returning_coder/version'

Gem::Specification.new do |s|
  s.name          = 'nil_returning_coder'
  s.summary       = 'A YAMLColumn coder that returns nil instead of a blank object'
  s.description   = 'This module defines an YAMLColumn coder that returns nil instead of a blank object.  Useful when the class you are serializing to/from does not allow uninitialized objects (such as a unit measurement)'

  s.license       = 'GPL-3'

  s.homepage          = 'https://github.com/NewRepublicBrewing/nil-returning-coder'

  s.add_dependency 'activerecord'
  s.add_dependency 'activesupport'

  s.add_development_dependency 'guard-rspec', '~> 2.0'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 2.0'

  s.authors       = ['Dean Brundage']
  s.email         = ['dean@newrepublicbrewing.com']

  s.files         = [
                      'LICENSE',
                      'README.md',
                      'lib/nil_returning_coder.rb',
                      'lib/nil_returning_coder/version.rb'
                    ]
  s.test_files    = [ 
                      'spec/cases/nil_returning_coder_spec.rb',
                      'spec/cases/version_spec.rb',
                      'spec/spec_helper.rb'
                    ]
  s.require_paths = ['lib']

  s.platform      = Gem::Platform::RUBY
  s.version       = NilReturningCoder.version
end

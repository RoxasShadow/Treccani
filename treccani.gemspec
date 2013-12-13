Kernel.load 'lib/treccani/version.rb'

Gem::Specification.new { |s|
  s.name          = 'treccani'
  s.version       = Treccani::version
  s.author        = 'Giovanni Capuano'
  s.email         = 'webmaster@giovannicapuano.net'
  s.homepage      = 'http://www.giovannicapuano.net'
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'RESTful API for Treccani.'
  s.description   = 'RESTful API to get the meaning and synonyms of italian all the italian terms.'
  s.licenses      = 'WTFPL'

  s.require_paths = ['lib']
  s.files         = Dir.glob('lib/**/*.rb')
  s.test_files    = Dir.glob('spec/**/*_spec.rb')

  s.add_runtime_dependency 'nokogiri'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
}
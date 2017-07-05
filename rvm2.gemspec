lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'rvm2/version'
require 'yaml'

Gem::Specification.new do |spec|
  spec.name        = 'rvm2'
  spec.version     = ::Rvm2::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Michal Papis']
  spec.email       = ['mpapis@gmail.com']
  spec.homepage    = 'https://github.com/rvm/rvm2'
  spec.summary     =
  spec.description = 'SM Framework aka RVM 2'
  spec.license     = 'Apache2'

  spec.add_dependency 'pluginator', '~>1.5.0'

  spec.executables  = Dir.glob('bin/**/*').map{|file| file.sub(/^bin\//, "") }
  spec.files        = Dir.glob('lib/**/*.rb')
end

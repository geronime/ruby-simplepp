# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'ruby-simplepp/version'

Gem::Specification.new do |s|
	s.name          = 'ruby-simplepp'
	s.version       = SimplePP::VERSION
	s.platform      = Gem::Platform::RUBY
	s.authors       = ['Jiri Nemecek']
	s.email         = ['nemecek.jiri@gmail.com']
	s.homepage      = ''
	s.description   = %q{simple pretty print}
	s.summary       = %q{simple string pretty print of hash/array structures}

	s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
	s.files         = `git ls-files`.split("\n")
	s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
	s.require_paths = ['lib']

end


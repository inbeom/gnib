# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gnib/version"

Gem::Specification.new do |s|
  s.name        = "gnib"
  s.version     = Gnib::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Inbeom Hwang"]
  s.email       = ["inbeom@wafflestudio.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby library for Microsoft Bing Search API}
  s.description = %q{Gnib provides interfaces for Bing Search API version 2.0}
  
  s.add_dependency "activesupport"
  s.add_development_dependency "rspec"

  # s.rubyforge_project = "gnib"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

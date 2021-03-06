# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "demoscopic_oauth2_provider/version"

Gem::Specification.new do |s|
  s.name        = "demoscopic_oauth2_provider"
  s.version     = Devise::Oauth2Providable::VERSION
  s.authors     = ["Ryan Sonnek", "Kelly Martin"]
  s.email       = ["ryan@socialcast.com"]
  s.homepage    = ""
  s.summary     = %q{OAuth2 Provider for Rails3 applications}
  s.description = %q{Rails3 engine that adds OAuth2 Provider support to any application built with Devise authentication and Mongoid}

  s.rubyforge_project = "demoscopic_oauth2_provider"

  s.add_runtime_dependency(%q<rails>, [">= 3.0.7"])
  s.add_runtime_dependency(%q<devise>, [">= 1.3.3"])
  s.add_runtime_dependency(%q<mongoid>, [">= 2.1.5"])
  s.add_runtime_dependency(%q<rack-oauth2>, ["~> 0.8.2"])
  s.add_development_dependency(%q<rspec>, ['>= 2.5.0'])

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

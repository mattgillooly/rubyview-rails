# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rubyview-rails/version"

Gem::Specification.new do |s|
  s.name        = "rubyview-rails"
  s.version     = RubyviewRails::VERSION
  s.authors     = ["Matt Gillooly"]
  s.email       = ["matt@mattgillooly.com"]
  s.homepage    = "http://github.com/mattgillooly/rubyview-rails"
  s.summary     = %q{Use Rubyview for Rails View templates}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "actionpack"

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'json' unless RUBY_VERSION =~ /^1.9/
  s.add_development_dependency 'rails', ENV["RAILS_VERSION"] || ">= 3.1.0"
  
end

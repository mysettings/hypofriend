# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hypofriend/version'

Gem::Specification.new do |s|
  s.name        = 'hypofriend'
  s.version     = Hypofriend::VERSION
  s.summary     = 'Hypofriend'
  s.description = 'Hypofriend'
  s.authors     = ['Duc Le']
  s.email       = 'mattbee90@gmail.com'
  s.files       = ['lib/hypofriend.rb', 'lib/hypofriend/client.rb', 'lib/hypofriend/offer.rb']
  s.homepage    = 'https://rubygems.org/gems/hypofriend'
  s.license     = 'MIT'

  s.add_dependency 'httparty'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
end

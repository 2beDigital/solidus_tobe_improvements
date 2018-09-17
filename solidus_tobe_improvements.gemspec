# coding: utf-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_tobe_improvements'
  s.version     = '0.1.9'
  s.summary     = '2BeDigital Improvements'
  s.description = '2BeDigital Improvements'
  s.required_ruby_version = '>= 2.2.0'

  s.author    = '2BeDigital'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'solidus_core', '>= 2.0'
  s.add_dependency 'solidus_trackers'
  s.add_dependency 'httparty', '>= 0.13.7'


  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.5'
  s.add_development_dependency 'sass-rails', '~> 5.0'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end

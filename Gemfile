source 'https://rubygems.org'

if ENV.key?('PUPPET_VERSION')
  puppetversion = "#{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['~> 3.0.1']
end

# Rake 10.2.0+ requires Ruby >= 1.9
gem 'rake', '< 10.2.0' if RUBY_VERSION < '1.9.0'
gem 'puppet', puppetversion
gem 'puppet-lint'
gem 'rspec-puppet'
gem 'puppetlabs_spec_helper'

# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "cartesian-product"
  gem.homepage = "http://github.com/aaw/cartesian-product"
  gem.license = "MIT"
  gem.summary = %Q{A cartesian product implementation in Ruby that doesn't hold the full product in memory}
  gem.description = %Q{A cartesian product implementation in Ruby that doesn't hold the full product in memory}
  gem.email = "aaron.windsor@gmail.com"
  gem.authors = ["Aaron Windsor"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec


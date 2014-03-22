# encoding: utf-8
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'jeweler'
require File.dirname(__FILE__) + '/lib/gtfs_engine/version'

Jeweler::Tasks.new do |gem|
  gem.name = 'gtfs-engine'
  gem.version = GtfsEngine::Version.to_s
  gem.homepage = 'http://github.com/sangster/gtfs-engine'
  gem.license = 'GPL 3'
  gem.summary = 'Read General Transit Feed Specification zip files'
  gem.description = <<-EOF.strip.gsub /\s+/, ' '
    Reads and parses zip files conforming to Google's GTFS spec.

    GTFS Spec: https://developers.google.com/transit/gtfs
  EOF
  gem.email = 'jon@ertt.ca'
  gem.authors = ['Jon Sangster']

  gem.files = Dir['{app,config,db,lib}/**/*', 'Rakefile']
end

Jeweler::RubygemsDotOrgTasks.new

task bump: ['bump:patch']
namespace :bump do
  %i[major minor patch].each do |part|
    bumper = GtfsEngine::Version::Bumper.new part
    desc "Bump the version to #{bumper}"
    task(part) { bumper.bump }
  end
end

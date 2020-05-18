# frozen_string_literal: true

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'juwelier'
require File.dirname(__FILE__) + '/lib/gtfs_engine/version'

Juwelier::Tasks.new do |gem|
  gem.name = 'gtfs_engine'
  gem.version = GtfsEngine::Version.to_s
  gem.homepage = 'http://github.com/sangster/gtfs_engine'
  gem.license = 'GPL-3.0'
  gem.summary = 'Read General Transit Feed Specification zip files'
  gem.description = <<-EOF.strip.gsub(/\s+/, ' ')
    A Rails Engine to provide a basic RESTful interface for GTFS feeds.

    GTFS Spec: https://developers.google.com/transit/gtfs
  EOF
  gem.email = 'jon@ertt.ca'
  gem.authors = ['Jon Sangster']

  gem.files = Dir['{app,config,db,lib}/**/*', 'Rakefile']
end

Juwelier::RubygemsDotOrgTasks.new

task bump: ['bump:patch']
namespace :bump do
  %i[major minor patch].each do |part|
    bumper = GtfsEngine::Version::Bumper.new part
    desc "Bump the version to #{bumper}"
    task(part) { bumper.bump }
  end
end

# encoding: utf-8
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'jeweler'

APP_RAKEFILE = File.expand_path("../test/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Jeweler::Tasks.new do |gem|
  gem.name = 'gtfs-engine'
  gem.version = '0.1'
  gem.homepage = 'http://github.com/sangster/gtfs-engine'
  gem.license = 'GPL 3'
  gem.summary = 'Read General Transit Feed Specification zip files'
  gem.description = <<-EOF.strip.gsub /\s+/, ' '
    Reads and parses zip files conforming to Google's GTFS spec.

    GTFS Spec: https://developers.google.com/transit/gtfs
  EOF
  gem.email = 'jon@ertt.ca'
  gem.authors = ['Jon Sangster']
end

Jeweler::RubygemsDotOrgTasks.new

#task bump: ['bump:patch']
#namespace :bump do
#  %i[major minor patch].each do |part|
#    bumper = GtfsReader::Version::Bumper.new part
#    desc "Bump the version to #{bumper}"
#    task(part) { bumper.bump }
#  end
#end

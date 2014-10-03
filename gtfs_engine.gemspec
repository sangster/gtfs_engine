# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: gtfs_engine 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "gtfs_engine"
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jon Sangster"]
  s.date = "2014-09-07"
  s.description = "Reads and parses zip files conforming to Google's GTFS spec. GTFS Spec: https://developers.google.com/transit/gtfs"
  s.email = "jon@ertt.ca"
  s.executables = ["rails"]
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    "Rakefile",
    "app/controllers/gtfs_engine/agencies_controller.rb",
    "app/controllers/gtfs_engine/application_controller.rb",
    "app/controllers/gtfs_engine/calendar_dates_controller.rb",
    "app/controllers/gtfs_engine/calendars_controller.rb",
    "app/controllers/gtfs_engine/data_sets_controller.rb",
    "app/controllers/gtfs_engine/fare_attributes_controller.rb",
    "app/controllers/gtfs_engine/fare_rules_controller.rb",
    "app/controllers/gtfs_engine/feed_infos_controller.rb",
    "app/controllers/gtfs_engine/frequencies_controller.rb",
    "app/controllers/gtfs_engine/routes_controller.rb",
    "app/controllers/gtfs_engine/shapes_controller.rb",
    "app/controllers/gtfs_engine/stop_times_controller.rb",
    "app/controllers/gtfs_engine/stops_controller.rb",
    "app/controllers/gtfs_engine/transfers_controller.rb",
    "app/controllers/gtfs_engine/trips_controller.rb",
    "app/helpers/gtfs_engine/default_views_helper.rb",
    "app/helpers/gtfs_engine/fields_helper.rb",
    "app/models/gtfs_engine/agency.rb",
    "app/models/gtfs_engine/calendar.rb",
    "app/models/gtfs_engine/calendar_date.rb",
    "app/models/gtfs_engine/data_set.rb",
    "app/models/gtfs_engine/fare_attribute.rb",
    "app/models/gtfs_engine/fare_rule.rb",
    "app/models/gtfs_engine/feed_info.rb",
    "app/models/gtfs_engine/frequency.rb",
    "app/models/gtfs_engine/route.rb",
    "app/models/gtfs_engine/shape.rb",
    "app/models/gtfs_engine/stop.rb",
    "app/models/gtfs_engine/stop_time.rb",
    "app/models/gtfs_engine/transfer.rb",
    "app/models/gtfs_engine/trip.rb",
    "app/views/gtfs_engine/calendars/dates.json.jsend",
    "app/views/gtfs_engine/data_sets/index.json.jsend",
    "app/views/gtfs_engine/data_sets/show.json.jsend",
    "app/views/gtfs_engine/gtfs/index.json.jsend",
    "app/views/gtfs_engine/gtfs/show.json.jsend",
    "app/views/gtfs_engine/transfers/from.json.jsend",
    "app/views/gtfs_engine/transfers/from_to.json.jsend",
    "app/views/gtfs_engine/transfers/to.json.jsend",
    "app/views/gtfs_engine/trips/block.json.jsend",
    "config/initializers/extensions_loader.rb",
    "config/routes.rb",
    "db/migrate/20140320045108_create_gtfs_engine_data_sets.rb",
    "db/migrate/20140320045232_create_gtfs_engine_calendars.rb",
    "db/migrate/20140320045751_create_gtfs_engine_calendar_dates.rb",
    "db/migrate/20140320050100_create_gtfs_engine_shapes.rb",
    "db/migrate/20140320051140_create_gtfs_engine_routes.rb",
    "db/migrate/20140320052005_create_gtfs_engine_stops.rb",
    "db/migrate/20140320052508_create_gtfs_engine_trips.rb",
    "db/migrate/20140320052907_create_gtfs_engine_stop_times.rb",
    "db/migrate/20140401032609_create_gtfs_engine_agencies.rb",
    "db/migrate/20140405235947_create_gtfs_engine_fare_attributes.rb",
    "db/migrate/20140406063500_create_gtfs_engine_fare_rules.rb",
    "db/migrate/20140406071922_create_gtfs_engine_frequencies.rb",
    "db/migrate/20140406072309_create_gtfs_engine_transfers.rb",
    "db/migrate/20140406073548_create_gtfs_engine_feed_infos.rb",
    "lib/ext.rb",
    "lib/gtfs_engine.rb",
    "lib/gtfs_engine/concerns.rb",
    "lib/gtfs_engine/concerns/controllers.rb",
    "lib/gtfs_engine/concerns/controllers/data_access.rb",
    "lib/gtfs_engine/concerns/controllers/gtfs.rb",
    "lib/gtfs_engine/engine.rb",
    "lib/gtfs_engine/exceptions.rb",
    "lib/gtfs_engine/json_responder.rb",
    "lib/gtfs_engine/middleware/base.rb",
    "lib/gtfs_engine/middleware/json_parse_errors.rb",
    "lib/gtfs_engine/sources.rb",
    "lib/gtfs_engine/version.rb",
    "lib/tasks/gtfs_engine_tasks.rake"
  ]
  s.homepage = "http://github.com/sangster/gtfs_engine"
  s.licenses = ["GPL 3"]
  s.rubygems_version = "2.2.2"
  s.summary = "Read General Transit Feed Specification zip files"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 4.1"])
      s.add_runtime_dependency(%q<gtfs-reader>, ["~> 0.2"])
      s.add_runtime_dependency(%q<activerecord-import>, ["~> 0.5"])
      s.add_runtime_dependency(%q<jbuilder>, ["~> 2.1"])
      s.add_runtime_dependency(%q<jsend_wrapper-rails>, ["~> 0.3"])
      s.add_development_dependency(%q<pry-rails>, ["~> 0.3"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 4.2"])
    else
      s.add_dependency(%q<rails>, ["~> 4.1"])
      s.add_dependency(%q<gtfs-reader>, ["~> 0.2"])
      s.add_dependency(%q<activerecord-import>, ["~> 0.5"])
      s.add_dependency(%q<jbuilder>, ["~> 2.1"])
      s.add_dependency(%q<jsend_wrapper-rails>, ["~> 0.3"])
      s.add_dependency(%q<pry-rails>, ["~> 0.3"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_dependency(%q<guard-rspec>, ["~> 4.2"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 4.1"])
    s.add_dependency(%q<gtfs-reader>, ["~> 0.2"])
    s.add_dependency(%q<activerecord-import>, ["~> 0.5"])
    s.add_dependency(%q<jbuilder>, ["~> 2.1"])
    s.add_dependency(%q<jsend_wrapper-rails>, ["~> 0.3"])
    s.add_dependency(%q<pry-rails>, ["~> 0.3"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0"])
    s.add_dependency(%q<guard-rspec>, ["~> 4.2"])
  end
end


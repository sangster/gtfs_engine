module GtfsEngine
  class Engine < ::Rails::Engine
    isolate_namespace GtfsEngine
    engine_name 'gtfs_engine'

    config.generators.instance_exec do
      template_engine     :jbuilder
      test_framework      :rspec, fixture: false
      stylesheets         false
      javascripts         false
      fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end

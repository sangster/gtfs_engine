# frozen_string_literal: true

# The following line is required for jsend_wrapper/rails to be available when
# mounted in another rails application.
require 'gtfs_engine/middleware/json_parse_errors'
require 'jsend_wrapper/rails'

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

    initializer 'gtfs_engine.middleware' do |app|
      app.config.middleware.insert_before ActionDispatch::Cookies,
                                          GtfsEngine::Middleware::JsonParseErrors
    end
  end
end

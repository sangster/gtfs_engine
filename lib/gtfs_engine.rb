require 'gtfs_reader'

require 'gtfs_engine/engine'
require 'gtfs_engine/exceptions'
require 'gtfs_engine/gtfs_views_helper'
require 'gtfs_engine/json_responder'
require 'gtfs_engine/sources'

module GtfsEngine
  extend ActiveSupport::Autoload

  autoload :Concerns

  class << self
    attr_accessor :send_aliased_keys

    def sources(&block)
      @sources ||= Sources.new GtfsReader.config
      block.call @sources
    end
  end
end

require 'gtfs_reader'

require 'gtfs_engine/engine'
require 'gtfs_engine/sources'

module GtfsEngine
  class << self
    attr_accessor :send_aliased_keys

    def sources(&block)
      @sources ||= Sources.new GtfsReader.config
      block.call @sources
    end
  end
end

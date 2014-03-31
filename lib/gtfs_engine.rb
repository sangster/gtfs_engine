require 'gtfs_reader'

require 'gtfs_engine/engine'
require 'gtfs_engine/sources'

module GtfsEngine
  def self.sources(&block)
    @sources ||= Sources.new GtfsReader.config
    block.call @sources
  end
end

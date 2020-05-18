# frozen_string_literal: true

require 'gtfs_reader'

require 'gtfs_engine/engine'
require 'gtfs_engine/exceptions'
require 'gtfs_engine/json_responder'
require 'gtfs_engine/sources'

module GtfsEngine
  extend ActiveSupport::Autoload

  autoload :Concerns

  class << self
    def sources(&block)
      @sources ||= Sources.new GtfsReader.config
      block.call @sources
    end
  end
end

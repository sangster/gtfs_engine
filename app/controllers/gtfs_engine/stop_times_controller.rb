# frozen_string_literal: true

module GtfsEngine
  class StopTimesController < ApplicationController
    include Concerns::Controllers::Gtfs

    gtfs_id :route_id

    filters :arrival_time,
            :departure_time,
            :stop_sequence,
            :stop_headsign,
            :pickup_type,
            :drop_off_type
  end
end

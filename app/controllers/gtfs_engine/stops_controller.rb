# frozen_string_literal: true

module GtfsEngine
  class StopsController < ApplicationController
    include Concerns::Controllers::Gtfs

    filters :stop_code,
            :stop_name,
            :stop_desc,
            :stop_lat,
            :stop_lon,
            :zone_id,
            :location_type,
            :parent_station,
            :stop_timezone,
            :wheelchair_boarding
  end
end

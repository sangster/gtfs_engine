module GtfsEngine
  class StopsController < ApplicationController
    include Concerns::Controllers::Gtfs
    filters %i{code name desc lat lon zone_id location_type parent_station
               stop_timezone wheelchair_boarding}
  end
end

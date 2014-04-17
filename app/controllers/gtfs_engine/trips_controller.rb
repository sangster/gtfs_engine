module GtfsEngine
  class TripsController < ApplicationController
    include Concerns::Controllers::Gtfs
    filters %i{service_id headsign short_name direction_id block_id route_id
               shape_id wheelchair_accessible bikes_allowed}

    def block
      @trips = collection.where block_id: params[:id]
      respond_with @trips
    end
  end
end

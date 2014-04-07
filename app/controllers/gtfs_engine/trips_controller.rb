module GtfsEngine
  class TripsController < ApplicationController
    def index
      @trips = data.trips
      respond_with @trips
    end

    def show
      @trip = data.trips.find_by trip_id: params[:id]
      respond_with @trip
    end

    def block
      @trips = data.trips.where block_id: params[:id]
      respond_with @trips
    end
  end
end

module GtfsEngine
  class TripsController < ApplicationController
    include Concerns::Controllers::Gtfs

    def block
      @trips = collection.where block_id: params[:id]
      respond_with @trips
    end
  end
end

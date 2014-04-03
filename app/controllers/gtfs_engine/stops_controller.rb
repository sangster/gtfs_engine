require_dependency 'gtfs_engine/application_controller'

module GtfsEngine
  class StopsController < ApplicationController
    def index
      @stops = data.stops
      respond_with @stops
    end

    def show
      @stop = data.stops.find_by stop_id: params[:id]
      respond_with @stop
    end
  end
end

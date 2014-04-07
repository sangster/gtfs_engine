module GtfsEngine
  class StopTimesController < ApplicationController
    def index
      @stop_times = data.stop_times
      respond_with @stop_times
    end

    def show
      @stop_time = data.stop_times.find_by route_id: params[:id]
      respond_with @stop_time
    end
  end
end

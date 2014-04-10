module GtfsEngine
  class FrequenciesController < ApplicationController
    def index
      @frequencies = data.frequencies
      respond_with @frequencies
    end

    def show
      @frequency = data.frequencies.find_by trip_id: params[:id]
      respond_with @frequency
    end
  end
end

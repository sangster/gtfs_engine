module GtfsEngine
  class FareRulesController < ApplicationController
    def index
      @rules = data.rules
      respond_with @rules
    end

    def show
      @rule = data.rules.find_by fare_id: params[:id]
      respond_with @rule
    end
  end
end

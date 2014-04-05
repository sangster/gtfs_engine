module GtfsEngine
  class AgenciesController < ApplicationController
    def index
      @agencies = Agency.all
      respond_with @agencies
    end

    def show
      @agency = Agency.find_by agency_id: params[:id]
      respond_with @agency
    end
  end
end

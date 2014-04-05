module GtfsEngine
  class RoutesController < ApplicationController
    def index
      @routes = data.routes
      respond_with @routes
    end

    def show
      @route = data.routes.find_by route_id: params[:id]
      respond_with @route
    end
  end
end

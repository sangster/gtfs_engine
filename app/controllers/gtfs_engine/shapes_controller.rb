module GtfsEngine
  class ShapesController < ApplicationController
    def show
      @shapes = data.shapes.where shape_id: params[:id]
      respond_with @shapes
    end
  end
end

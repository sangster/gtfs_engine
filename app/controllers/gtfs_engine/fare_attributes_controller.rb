module GtfsEngine
  class FareAttributesController < ApplicationController
    def index
      @attributes = data.attributes
      respond_with @attributes
    end

    def show
      @attribute = data.attributes.find_by fare_id: params[:id]
      respond_with @attribute
    end
  end
end

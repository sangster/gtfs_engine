require_dependency 'gtfs_engine/application_controller'

module GtfsEngine
  class DataSetsController < ApplicationController
    def index
      @data_sets = DataSet.all
      respond_with @data_sets
    end

    def show
      @data_set = DataSet.find params[:id]
      respond_with @data_set
    end
  end
end

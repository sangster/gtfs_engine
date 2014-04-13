module GtfsEngine
  class DataSetsController < ApplicationController
    def index
      @data_sets = DataSet.all
      respond_with @data_sets
    end

    def show
      @data_set = data :id

      # Set location if the given id is a data-source name and not an ID
      if param_is_name? :id
        respond_with @data_set, location: data_set_url(@data_set)
      else
        respond_with @data_set
      end
    end
  end
end

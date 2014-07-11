module GtfsEngine
  class DataSetsController < ApplicationController
    def index
      expires_in 2.hours

      @data_sets = Rails.cache.fetch('data_sets_index') { DataSet.all }

      cache = {
          last_modified: @data_sets.collect(&:created_at).max,
          public: true
      }

      respond_with @data_sets if stale? cache
    end

    def show
      expires_in 2.hours

      @data_set = data :id

      # Set location if the given id is a data-source name and not an ID
      if param_is_data_set_name? :id
        respond_with @data_set, location: data_set_url(@data_set)
      else
        respond_with @data_set
      end
    end
  end
end

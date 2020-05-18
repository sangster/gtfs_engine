# frozen_string_literal: true

module GtfsEngine
  class DataSetsController < ApplicationController
    def index
      expires_in(3.hours)

      @data_sets = Rails.cache.fetch('data_sets_index') do
        {}.tap do |sets|
          DataSet.order(:created_at).each do |set|
            (sets[set.name] ||= []) << set
          end
        end
      end

      dates = @data_sets.values.flatten.collect(&:created_at)
      respond_with(@data_sets) if stale?(last_modified: dates.max, public: true)
    end

    def show
      expires_in(2.hours)

      @data_set = data(:id)

      # Set location if the given id is a data-source name and not an ID
      if param_is_data_set_name?(:id)
        respond_with(@data_set, location: data_set_url(@data_set))
      else
        respond_with(@data_set)
      end
    end
  end
end

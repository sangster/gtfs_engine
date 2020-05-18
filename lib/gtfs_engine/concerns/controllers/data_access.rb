# frozen_string_literal: true

module GtfsEngine
  module Concerns
    module Controllers
      module DataAccess
        extend ActiveSupport::Concern

        # @param param_key <Symbol> The key of the URL param to use as the feed's ID
        # @return <DataSet>
        def data(param_key = :data_set_id)
          key = params[param_key]
          (@data_sets ||= {})[key] =
            Rails.cache.fetch("data_set_#{key}") do
              if param_is_data_set_name?(param_key)
                GtfsEngine::DataSet.where(name: key).newest
              else
                GtfsEngine::DataSet.find(params[param_key])
              end
            end
        end

        def data_cache(key, &blk)
          Rails.cache.fetch("#{data.id}::#{key}", &blk)
        end

        # @return <Bool> +true+ if the key is the name of the GTFS feed,
        # instead of its ID
        def param_is_data_set_name?(param_key)
          !(/[[:digit:]]/ === params[param_key].try(:first))
        end
      end
    end
  end
end

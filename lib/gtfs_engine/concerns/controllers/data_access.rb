# A Controller +Concern+ for convenient access to the +DataSet+ specified in
# the URL.
module GtfsEngine::Concerns::Controllers::DataAccess
  extend ActiveSupport::Concern

  #@param param_key <Symbol> The key of the URL param to use as the feed's ID
  #@return <DataSet>
  def data(param_key=:data_set_id)
    key = params[param_key]
    (@data_sets ||= {})[key] =
        Rails.cache.fetch "data_set_#{key}" do
          if param_is_data_set_name? param_key
            GtfsEngine::DataSet.where(name: key).newest
          else
            GtfsEngine::DataSet.find params[param_key]
          end
        end
  end

  def data_cache(key)
    Rails.cache.fetch "#{data.id}::#{key}" do
      yield
    end
  end

  #@return <Bool> +true+ if the key is the name of the GTFS feed,
  # instead of its ID
  def param_is_data_set_name?(param_key)
    not /[[:digit:]]/ === params[param_key].try(:first)
  end
end

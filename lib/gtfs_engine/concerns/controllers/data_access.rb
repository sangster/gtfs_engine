module GtfsEngine::Concerns::Controllers::DataAccess
  extend ActiveSupport::Concern

  included do
    protected

    def data(param_key=:data_set_id)
      key = params[param_key]
      (@data_sets ||= {})[key] =
        begin
          if param_is_name? param_key
            GtfsEngine::DataSet.where(name: key).newest
          else
            DataSet.find params[param_key]
          end
        end
    end

    def param_is_name?(param_key)
      not /[[:digit:]]/ === params[param_key].try(:first)
    end
  end
end

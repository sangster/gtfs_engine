module GtfsEngine::Concerns::Controllers::DataAccess
  extend ActiveSupport::Concern

  included do
    protected

    def data(param_key=:data_set_id)
      key = params[param_key]
      (@data_sets ||= {})[key] =
        begin
          if /[[:digit:]]/ === key.first
            DataSet.find params[param_key]
          else
            GtfsEngine::DataSet.where(name: key).newest
          end
        end
    end
  end
end

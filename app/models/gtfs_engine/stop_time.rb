module GtfsEngine
  class StopTime < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :stop_times
  end
end

module GtfsEngine
  class StopTime < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :stop_times
    belongs_to :trip,     inverse_of: :stop_times, shared_key: :trip_id
    belongs_to :stop,     inverse_of: :stop_time,  shared_key: :stop_id
  end
end

module GtfsEngine
  class Trip < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :trips
    belongs_to :route,    inverse_of: :trips, shared_key: :route_id
    belongs_to :calendar, inverse_of: :trips, shared_key: :service_id

    has_many :shapes,     inverse_of: :trip, shared_key: :shape_id
    has_many :stop_times, inverse_of: :trip, shared_key: :trip_id

    has_many :stops, through: :stop_times
  end
end

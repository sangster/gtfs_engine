module GtfsEngine
  class Route < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :routes

    has_many :trips, inverse_of: :route, shared_key: :route_id

    has_many :calendars, through: :trips
    has_many :shapes,    through: :trips
  end
end

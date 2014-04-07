module GtfsEngine
  class Route < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :routes

    has_many :trips, inverse_of: :route, shared_key: :route_id

    has_many :calendars, through: :trips
    has_many :shapes,    through: :trips

    prefix_aliases :route, *%i(short_name long_name desc type url color text_color)
  end
end

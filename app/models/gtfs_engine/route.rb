module GtfsEngine
  class Route < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :routes
  end
end

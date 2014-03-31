module GtfsEngine
  class Shape < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :shapes
    belongs_to :trip,     inverse_of: :shapes, shared_key: :shape_id
  end
end

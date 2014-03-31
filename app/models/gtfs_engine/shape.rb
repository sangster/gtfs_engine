module GtfsEngine
  class Shape < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :shapes
  end
end

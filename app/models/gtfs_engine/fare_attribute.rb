module GtfsEngine
  class FareAttribute < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :fare_attributes
  end
end

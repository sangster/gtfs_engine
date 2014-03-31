module GtfsEngine
  class Trip < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :trips
  end
end

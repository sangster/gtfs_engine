module GtfsEngine
  class Stop < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :stops
  end
end

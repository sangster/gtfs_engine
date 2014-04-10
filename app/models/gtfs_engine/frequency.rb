module GtfsEngine
  class Frequency < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :frequencies
    belongs_to :trip,     inverse_of: :frequencies, shared_key: :trip_id
  end
end

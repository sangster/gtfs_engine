module GtfsEngine
  class Stop < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :stops

    has_many :stop_time, inverse_of: :stop, shared_key: :stop_id
  end
end

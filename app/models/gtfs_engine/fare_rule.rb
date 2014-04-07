module GtfsEngine
  class FareRule < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :trips
    belongs_to :fare_attribute, inverse_of: :fare_rules, shared_key: :fare_id
    belongs_to :route,          inverse_of: :fare_rules, shared_key: :route_id
  end
end

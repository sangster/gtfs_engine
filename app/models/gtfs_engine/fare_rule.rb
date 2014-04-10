module GtfsEngine
  class FareRule < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :trips
    belongs_to :fare_attribute, inverse_of: :fare_rules,   shared_key: :fare_id
    belongs_to :route,          inverse_of: :fare_rules,   shared_key: :route_id

    belongs_to :stop, inverse_of: :origin_rules,
               foreign_key: :origin_id, primary_key: :zone_id
    belongs_to :stop, inverse_of: :destination_rules,
               foreign_key: :destination_id, primary_key: :zone_id
  end
end

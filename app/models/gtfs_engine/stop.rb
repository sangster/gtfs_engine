module GtfsEngine
  class Stop < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :stops

    has_many :stop_time, inverse_of: :stop, shared_key: :stop_id

    with_options foreign_key: :origin_id, primary_key: :zone_id do
      has_many :origin_rules,      inverse_of: :stop, class_name: 'fare_rule'
      has_many :destination_rules, inverse_of: :stop, class_name: 'fare_rule'
    end

    prefix_aliases :stop, *%i(code name desc lat lon url timezone)
  end
end

# frozen_string_literal: true

module GtfsEngine
  class Stop < ActiveRecord::Base
    belongs_to :data_set, optional: false

    has_many :stop_time, foreign_key: :stop_id, primary_key: :stop_id

    with_options(foreign_key: :origin_id, primary_key: :zone_id) do
      has_many :origin_rules,      inverse_of: :stop, class_name: 'fare_rule'
      has_many :destination_rules, inverse_of: :stop, class_name: 'fare_rule'
    end
  end
end

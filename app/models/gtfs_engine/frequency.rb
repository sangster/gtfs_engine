# frozen_string_literal: true

module GtfsEngine
  class Frequency < ActiveRecord::Base
    belongs_to :data_set, optional: false
    belongs_to :trip,     optional: false,
                          foreign_key: :trip_id, primary_key: :trip_id
  end
end

# frozen_string_literal: true

module GtfsEngine
  class StopTime < ActiveRecord::Base
    belongs_to :data_set, optional: false
    belongs_to :trip, foreign_key: :trip_id, primary_key: :trip_id
    belongs_to :stop, foreign_key: :stop_id, primary_key: :stop_id
  end
end

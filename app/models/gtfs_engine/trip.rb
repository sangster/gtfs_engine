# frozen_string_literal: true

module GtfsEngine
  class Trip < ActiveRecord::Base
    belongs_to :data_set, optional: false
    belongs_to :route,    foreign_key: :route_id, primary_key: :route_id
    belongs_to :calendar, foreign_key: :service_id, primary_key: :service_id

    has_many :frequencies, foreign_key: :trip_id, primary_key: :trip_id
    has_many :shapes,      foreign_key: :shape_id, primary_key: :shape_id
    has_many :stop_times,  foreign_key: :trip_id, primary_key: :trip_id

    has_many :stops, through: :stop_times
  end
end

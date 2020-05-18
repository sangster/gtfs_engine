# frozen_string_literal: true

module GtfsEngine
  class Route < ActiveRecord::Base
    belongs_to :data_set, optional: false

    has_many :trips, foreign_key: :route_id, primary_key: :route_id

    has_many :calendars, through: :trips
    has_many :shapes,    through: :trips
  end
end

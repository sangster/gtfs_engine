# frozen_string_literal: true

module GtfsEngine
  class Shape < ActiveRecord::Base
    belongs_to :data_set, optional: false
    belongs_to :trip,     optional: false,
                          foreign_key: :shape_id, primary_key: :shape_id
  end
end

# frozen_string_literal: true

module GtfsEngine
  class FareAttribute < ActiveRecord::Base
    belongs_to :data_set, optional: false
  end
end

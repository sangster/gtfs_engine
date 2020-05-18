# frozen_string_literal: true

module GtfsEngine
  class FareRulesController < ApplicationController
    include Concerns::Controllers::Gtfs

    gtfs_id :fare_id

    filters :route_id,
            :origin_id,
            :destination_id,
            :contains_id
  end
end

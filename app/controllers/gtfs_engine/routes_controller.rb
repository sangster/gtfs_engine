# frozen_string_literal: true

module GtfsEngine
  class RoutesController < ApplicationController
    include Concerns::Controllers::Gtfs

    filters :agency_id,
            :route_short_name,
            :route_long_name,
            :route_type,
            :agency
  end
end

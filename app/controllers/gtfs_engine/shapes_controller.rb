# frozen_string_literal: true

module GtfsEngine
  class ShapesController < ApplicationController
    include Concerns::Controllers::Gtfs

    filters :shape_pt_lat,
            :shape_pt_lon,
            :shape_pt_sequence
  end
end

module GtfsEngine
  class ShapesController < ApplicationController
    include Concerns::Controllers::Gtfs
    filters %i{pt_lat pt_lon pt_sequence}
  end
end

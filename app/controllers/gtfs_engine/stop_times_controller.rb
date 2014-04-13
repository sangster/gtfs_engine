module GtfsEngine
  class StopTimesController < ApplicationController
    include Concerns::Controllers::Gtfs
    gtfs_id :route_id
  end
end

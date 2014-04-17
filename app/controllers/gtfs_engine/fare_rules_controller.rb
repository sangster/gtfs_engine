module GtfsEngine
  class FareRulesController < ApplicationController
    include Concerns::Controllers::Gtfs
    gtfs_id :fare_id
    filters %i{route_id origin_id destination_id contains_id}
  end
end

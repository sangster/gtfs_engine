module GtfsEngine
  class FareRulesController < ApplicationController
    include Concerns::Controllers::Gtfs
    gtfs_id :fare_id
  end
end

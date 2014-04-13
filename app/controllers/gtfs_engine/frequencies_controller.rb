module GtfsEngine
  class FrequenciesController < ApplicationController
    include Concerns::Controllers::Gtfs
    gtfs_id :trip_id
  end
end

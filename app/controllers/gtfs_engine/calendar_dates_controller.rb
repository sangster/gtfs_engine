module GtfsEngine
  class CalendarDatesController < ApplicationController
    include Concerns::Controllers::Gtfs
    gtfs_id :service_id
  end
end

module GtfsEngine
  class CalendarsController < ApplicationController
    include Concerns::Controllers::Gtfs
    gtfs_id :service_id
    filters %i{monday tuesday wednesday thursday friday saturday sunday
               start_date end_date}

    def dates
      @dates = record.dates
      render :dates
    end
  end
end

module GtfsEngine
  class CalendarsController < ApplicationController
    include Concerns::Controllers::Gtfs
    gtfs_id :service_id

    def dates
      @dates = record.dates
      render :dates
    end
  end
end

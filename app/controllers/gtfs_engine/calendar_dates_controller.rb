module GtfsEngine
  class CalendarDatesController < ApplicationController
    def index
      @dates = data.calendar_dates
      respond_with @dates
    end

    def show
      @date = data.calendar_dates.find_by service_id: params[:id]
      respond_with @date
    end
  end
end

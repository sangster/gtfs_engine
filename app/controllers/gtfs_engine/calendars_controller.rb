module GtfsEngine
  class CalendarsController < ApplicationController
    def index
      @calendars = data.calendars
      respond_with @calendars
    end

    def show
      @calendar = data.calendars.find_by service_id: params[:id]
      respond_with @calendar
    end

    def dates
      @dates = data.calendars.find_by(service_id: params[:id]).dates
      render :dates
    end
  end
end

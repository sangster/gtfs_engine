# frozen_string_literal: true

module GtfsEngine
  class CalendarsController < ApplicationController
    include Concerns::Controllers::Gtfs

    gtfs_id :service_id

    filters :monday,
            :tuesday,
            :wednesday,
            :thursday,
            :friday,
            :saturday,
            :sunday,
            :start_date,
            :end_date

    def for_date
      date = params[:YYYY_MM_DD]
      check_format!(date)
      @records = Calendar.from_date_string(date)
      respond_with(@records, template: 'gtfs_engine/gtfs/index')
    end

    def dates
      @dates = record.dates
      render(:dates)
    end

    private

    def check_format!(date_str)
      unless /^\d{4}-\d\d-\d\d$/ === date_str
        raise DateFormatError, "Got '#{date_str}. Expected format: YYYY-MM-DD'"
      end
    end
  end
end

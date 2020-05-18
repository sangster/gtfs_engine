# frozen_string_literal: true

module GtfsEngine
  class CalendarDatesController < ApplicationController
    include Concerns::Controllers::Gtfs
    gtfs_id :service_id
    filters :date,
            :exception_type
  end
end

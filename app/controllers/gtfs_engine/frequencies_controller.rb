# frozen_string_literal: true

module GtfsEngine
  class FrequenciesController < ApplicationController
    include Concerns::Controllers::Gtfs

    gtfs_id :trip_id

    filters :start_time,
            :end_time,
            :headway_secs,
            :exact_times
  end
end

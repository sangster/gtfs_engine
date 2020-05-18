# frozen_string_literal: true

module GtfsEngine
  class FeedInfosController < ApplicationController
    include Concerns::Controllers::Gtfs

    filters :feed_publisher_name,
            :feed_publisher_url,
            :feed_lang,
            :feed_start_date,
            :feed_end_date,
            :feed_version
  end
end

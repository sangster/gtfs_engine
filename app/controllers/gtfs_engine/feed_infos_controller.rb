module GtfsEngine
  class FeedInfosController < ApplicationController
    include Concerns::Controllers::Gtfs
    filters %i{publisher_name publisher_url lang start_date end_date version}
  end
end

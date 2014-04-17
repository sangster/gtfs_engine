module GtfsEngine
  class RoutesController < ApplicationController
    include Concerns::Controllers::Gtfs
    filters %i{agency_id short_name long_name type agency}
  end
end

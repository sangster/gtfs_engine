module GtfsEngine
  class AgenciesController < ApplicationController
    include Concerns::Controllers::Gtfs
    filters %i{name url timezone lang}
  end
end

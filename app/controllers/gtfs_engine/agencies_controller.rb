# frozen_string_literal: true

module GtfsEngine
  class AgenciesController < ApplicationController
    include Concerns::Controllers::Gtfs

    filters :agency_name,
            :agency_url,
            :agency_timezone,
            :agency_lang
  end
end

# frozen_string_literal: true

module GtfsEngine
  class FareAttributesController < ApplicationController
    include Concerns::Controllers::Gtfs

    gtfs_id :fare_id

    filters :price,
            :currency_type,
            :payment_method,
            :transfers,
            :transfer_duration
  end
end

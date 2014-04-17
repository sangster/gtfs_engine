module GtfsEngine
  class TransfersController < ApplicationController
    include Concerns::Controllers::Gtfs
    filters %i{transfer_type min_transfer_time}

    def from
      @transfers = collection.where from_stop_id: params[:stop_id]
      respond_with @transfers
    end

    def to
      @transfers = collection.where to_stop_id: params[:stop_id]
      respond_with @transfers
    end

    def from_to
      @transfer = collection.find_by from_stop_id: params[:from_id],
                                       to_stop_id: params[:to_id]
      respond_with @transfer
    end
  end
end

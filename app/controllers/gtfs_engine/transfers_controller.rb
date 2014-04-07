module GtfsEngine
  class TransfersController < ApplicationController
    def index
      @transfers = data.transfers
      respond_with @transfers
    end

    def from
      @transfers = data.transfers.where from_stop_id: params[:stop_id]
      respond_with @transfers
    end

    def to
      @transfers = data.transfers.where to_stop_id: params[:stop_id]
      respond_with @transfers
    end

    def from_to
      @transfer = data.transfers.find_by from_stop_id: params[:from_id],
                                           to_stop_id: params[:to_id]
      respond_with @transfer
    end
  end
end

module GtfsEngine
  class ApplicationController < ActionController::Base
    respond_to :json

    protected

    def data
      @data_set ||= DataSet.find params[:data_set_id]
    end
  end
end

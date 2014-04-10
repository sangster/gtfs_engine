module GtfsEngine
  class ApplicationController < ActionController::Base
    include Concerns::Controllers::DataAccess

    respond_to :json
  end
end

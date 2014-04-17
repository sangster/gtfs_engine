module GtfsEngine
  class ApplicationController < ActionController::Base
    include Concerns::Controllers::DataAccess
    respond_to :json
    self.responder = GtfsEngine::JsonResponder
  end
end

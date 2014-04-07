module GtfsEngine
  class FeedInfosController < ApplicationController
    def index
      @feed_infos = data.feed_infos
      respond_with @feed_infos
    end
  end
end

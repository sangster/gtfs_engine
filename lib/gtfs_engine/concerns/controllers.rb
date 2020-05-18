# frozen_string_literal: true

module GtfsEngine
  module Concerns
    module Controllers
      extend ActiveSupport::Autoload

      autoload :DataAccess
      autoload :Gtfs
    end
  end
end

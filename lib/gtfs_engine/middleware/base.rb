# frozen_string_literal: true

# The following line is required for jsend_wrapper/rails to be available when
# mounted in another rails application.
module GtfsEngine
  module Middleware
    class Base
      attr_reader :app

      HEADERS = { 'Content-Type' => 'application/json' }.freeze

      def initialize(app)
        @app = app
      end

      protected

      def accepts_json?(env)
        request = ActionDispatch::Request.new(env)
        !!collector.negotiate_format(request)
      end

      private

      def collector
        @collector ||= ActionController::MimeResponds::Collector.new(['json'])
      end
    end
  end
end

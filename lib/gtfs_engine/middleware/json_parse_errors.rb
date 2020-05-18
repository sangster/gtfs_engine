# frozen_string_literal: true

# The following line is required for jsend_wrapper/rails to be available when
# mounted in another rails application.
require 'gtfs_engine/middleware/base'
require 'jsend_wrapper/renderers/error_renderer'

module GtfsEngine
  module Middleware
    # Normally one handles exceptions with `rescue_from`; however, the body of
    # the request is parsed before your controller gets involved, so we need to
    # handle parse errors at the middleware-level.
    #
    # Rails has a built-in JSON response when such an error occurs, but this
    # middleware will return an error message in JSend format.
    class JsonParseErrors < Base
      ERROR_CODE = 1001
      MESSAGE = 'The body of your request is not valid JSON'

      def call(env)
        app.call(env)
      rescue ActionDispatch::ParamsParser::ParseError => e
        raise e unless accepts_json?(env)

        [400, HEADERS, [create_json(e)]]
      end

      private

      def create_json(cause)
        JsendWrapper::ErrorRenderer.new(
          MESSAGE, code: ERROR_CODE, data: cause.to_s
        ).to_s
      end
    end
  end
end

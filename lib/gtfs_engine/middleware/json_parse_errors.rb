# This file is part of the KNOWtime server.
#
# The KNOWtime server is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
#
# The KNOWtime server is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License
# along with the KNOWtime server.  If not, see <http://www.gnu.org/licenses/>.

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
        app.call env

      rescue ActionDispatch::ParamsParser::ParseError => error
        raise error unless accepts_json? env

        [ 400, HEADERS, [create_json(error)] ]
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

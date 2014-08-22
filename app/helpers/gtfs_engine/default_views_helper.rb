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
module GtfsEngine
  module DefaultViewsHelper
    def index(json, records)
      json.cache! [controller_name, filter] do
        json.ignore_nil! true
        json.array!(records) {|record| json.extract! record, *fields }
      end
    end


    def show(json, record)
      json.cache! record do
        json.ignore_nil! true
        json.extract! record, *fields
      end
    end
  end
end

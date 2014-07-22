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
  class CalendarsController < ApplicationController
    include Concerns::Controllers::Gtfs

    gtfs_id :service_id

    filters :monday,
            :tuesday,
            :wednesday,
            :thursday,
            :friday,
            :saturday,
            :sunday,
            :start_date,
            :end_date

    def for_date
      date = params[:YYYY_MM_DD]
      check_format! date
      @records = Calendar.from_date_string date
      respond_with @records, template: 'gtfs_engine/gtfs/index'
    end

    def dates
      @dates = record.dates
      render :dates
    end

    private

    def check_format!(date_str)
      unless %r{^\d{4}-\d\d-\d\d$} === date_str
        raise DateFormatError, "Got '#{date_str}. Expected format: YYYY-MM-DD'"
      end
    end
  end
end

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
  class TransfersController < ApplicationController
    include Concerns::Controllers::Gtfs

    filters :transfer_type,
            :min_transfer_time

    def from
      @transfers = collection.where from_stop_id: params[:stop_id]
      respond_with @transfers
    end

    def to
      @transfers = collection.where to_stop_id: params[:stop_id]
      respond_with @transfers
    end

    def from_to
      @transfer = collection.find_by from_stop_id: params[:from_id],
                                       to_stop_id: params[:to_id]
      respond_with @transfer
    end
  end
end

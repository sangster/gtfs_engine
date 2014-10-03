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
  class Trip < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :trips
    belongs_to :route,    inverse_of: :trips,
               foreign_key: :route_id, primary_key: :route_id
    belongs_to :calendar, inverse_of: :trips,
               foreign_key: :service_id, primary_key: :service_id

    has_many :frequencies, inverse_of: :trip,
             foreign_key: :trip_id, primary_key: :trip_id
    has_many :shapes,      inverse_of: :trip,
             foreign_key: :shape_id, primary_key: :shape_id
    has_many :stop_times,  inverse_of: :trip,
             foreign_key: :trip_id, primary_key: :trip_id

    has_many :stops, through: :stop_times
  end
end

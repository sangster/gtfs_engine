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
  class Route < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :routes

    has_many :trips, inverse_of: :route, shared_key: :route_id

    has_many :calendars, through: :trips
    has_many :shapes,    through: :trips

    prefix_aliases :route, *%i(short_name long_name desc type url color text_color)
  end
end

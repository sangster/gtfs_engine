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
  class FareRule < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :trips
    belongs_to :fare_attribute, inverse_of: :fare_rules,   primary_key: :fare_id, foreign_key: :fare_id
    belongs_to :route,          inverse_of: :fare_rules,   primary_key: :route_id, foreign_key: :route_id

    with_options class_name: 'Stop', primary_key: :zone_id do |rule|
      rule.belongs_to :origin,      inverse_of: :origin_rules,
                                   foreign_key: :origin_id
      rule.belongs_to :destination, inverse_of: :destination_rules,
                                   foreign_key: :destination_id
    end
  end
end

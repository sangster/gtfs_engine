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
#
# Many GTFS classes have fields named with a shared prefix, such as
# "route_short_name", and "route_long_name".
module ActiveRecord
  class << Base
    def aliases
      @aliases ||= ActiveSupport::HashWithIndifferentAccess.new
    end

    def prefix_aliases(prefix, *aliases)
      aliases.each do |al|
        self.aliases[al] = "#{prefix}_#{al}"
        alias_attribute al, self.aliases[al]
      end
    end

    def unprefixed_attributes
      attribute_names - aliases.values - %w(id data_set_id)
    end
  end
end

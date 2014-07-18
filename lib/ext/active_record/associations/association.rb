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
# Many GTFS associations reference arbitrary fields in the referenced table.
# This requires the use of the +primary_key:+ named parameter. Coincidentally,
# the name of the +foreign_key:+ is often the same as the referenced field. As
# a convenience, this file adds a +shared_key:+ named parameter which simply
# sets these two parameters to the same value.
module ActiveRecord
  module Associations
    class Association
      def build_record_with_shared_key(attributes)
        share_key attributes
        build_record_without_shared_key attributes
      end
      alias_method_chain :build_record, :shared_key

      private

      def share_key(attributes)
        h = attributes.last
        if Hash === h and h.key? :shared_key
          key = h.delete :shared_key
          h.reverse_merge! foreign_key: key, primary_key: key
        end
      end
    end
  end
end

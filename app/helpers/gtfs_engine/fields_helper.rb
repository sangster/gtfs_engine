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
  module FieldsHelper
    def fields
      (@fields ||= {})[model] ||= create_fields
    end

    private

    def model
      @model ||= controller_name.classify
    end

    def create_fields
      attribute_names - [:id, :data_set_id]
    end
  end
end

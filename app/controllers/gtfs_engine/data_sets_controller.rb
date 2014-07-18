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
  class DataSetsController < ApplicationController
    def index
      expires_in 3.hours

      @data_sets = Rails.cache.fetch('data_sets_index') do
        {}.tap do |sets|
          DataSet.order(:created_at).each do |set|
            (sets[set.name] ||= []) << set
          end
        end
      end

      dates = @data_sets.values.flatten.collect &:created_at
      if stale? last_modified: dates.max, public: true
        respond_with @data_sets
      end
    end

    def show
      expires_in 2.hours

      @data_set = data :id

      # Set location if the given id is a data-source name and not an ID
      if param_is_data_set_name? :id
        respond_with @data_set, location: data_set_url(@data_set)
      else
        respond_with @data_set
      end
    end
  end
end

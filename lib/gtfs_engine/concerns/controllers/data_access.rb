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

# A Controller +Concern+ for convenient access to the +DataSet+ specified in
# the URL.
module GtfsEngine::Concerns::Controllers::DataAccess
  extend ActiveSupport::Concern


  #@param param_key <Symbol> The key of the URL param to use as the feed's ID
  #@return <DataSet>
  def data(param_key=:data_set_id)
    key = params[param_key]
    (@data_sets ||= {})[key] =
        Rails.cache.fetch "data_set_#{key}" do
          if param_is_data_set_name? param_key
            GtfsEngine::DataSet.where(name: key).newest
          else
            GtfsEngine::DataSet.find params[param_key]
          end
        end
  end


  def data_cache(key)
    Rails.cache.fetch("#{data.id}::#{key}") { yield }
  end


  #@return <Bool> +true+ if the key is the name of the GTFS feed,
  # instead of its ID
  def param_is_data_set_name?(param_key)
    not /[[:digit:]]/ === params[param_key].try(:first)
  end
end

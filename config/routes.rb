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
GtfsEngine::Engine.routes.draw do
  with_options only: [:index, :show], defaults: {format: :json} do |r|

    r.resources :data_sets, path: '' do
      r.resources :agencies
      r.resources :stops
      r.resources :routes
      r.resources :trips, only: [:show] do
        collection { get 'block/:id', action: :block }
      end
      r.resources :stop_times
      r.resources :calendars do
        collection { get 'for_date/:YYYY_MM_DD', action: :for_date }
        member { get :dates }
      end
      r.resources :calendar_dates
      r.resources :fare_attributes
      r.resources :fare_rules
      r.resources :shapes, only: [:show]
      r.resources :frequencies
      r.resources :transfers, only: [:index] do
        collection do
          get 'from/:stop_id', action: :from
          get 'to/:stop_id', action: :to
          get 'from/:from_id/to/:to_id', action: :from_to
        end
      end
      r.resources :feed_infos, only: [:index]
    end
  end
end

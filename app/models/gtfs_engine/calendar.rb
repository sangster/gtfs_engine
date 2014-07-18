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
  class Calendar < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :calendars

    has_many :calendar_dates, inverse_of: :calendar, shared_key: :service_id
    has_many :trips,          inverse_of: :calendar, shared_key: :service_id

    has_many :routes, through: :trips
    has_many :shapes, through: :trips

    alias_attribute :dates, :calendar_dates


    class << self
      # @return <ActiveRecord_Relation> the set of Calendars that include the
      #   given date.
      # This method will add/remove entries listed in CalendarDate and will also
      # filter out entries which don't match the correct day-of-week.
      def from_date_string(date)
        dates = GtfsEngine::CalendarDate.where date: date

        add = dates.where(exception_type: 1).pluck :service_id
        query =
          if add.any?
            where '((start_date <= :date AND end_date >= :date)
                   OR service_id IN (:ids)', date: date, ids: add
          else
            where '(start_date <= :date AND end_date >= :date)', date: date
          end

        query = where_day_of_week query, date

        rem = dates.where(exception_type: 2).pluck :service_id
        if rem.any?
          query.where '(service_id NOT IN (?))', rem
        else
          query
        end
      end

      private

      # Modifies the given query to only matches the day of the week represented
      # by the given date (format: YYYY-MM-DD)
      def where_day_of_week(query, date_str)
        case Date.new( *date_str.split('-').map(&:to_i) ).cwday
        when 1 then query.where monday:    true
        when 2 then query.where tuesday:   true
        when 3 then query.where wednesday: true
        when 4 then query.where thursday:  true
        when 5 then query.where friday:    true
        when 6 then query.where saturday:  true
        else        query.where sunday:    true
        end
      end

    end

  end

  DateFormatError = Class.new StandardError
end

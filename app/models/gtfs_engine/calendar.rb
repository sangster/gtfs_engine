# frozen_string_literal: true

module GtfsEngine
  class Calendar < ActiveRecord::Base
    belongs_to :data_set, optional: false

    has_many :calendar_dates, foreign_key: :service_id, primary_key: :service_id
    has_many :trips, foreign_key: :service_id, primary_key: :service_id

    has_many :routes, through: :trips
    has_many :shapes, through: :trips

    alias_attribute :dates, :calendar_dates

    class << self
      # @return <ActiveRecord_Relation> the set of Calendars that include the
      #   given date.
      # This method will add/remove entries listed in CalendarDate and will also
      # filter out entries which don't match the correct day-of-week.
      #
      # TODO: Currently, this method does 3 SQL queries. Try to lower this.
      def from_date_string(date)
        dates = GtfsEngine::CalendarDate.where(date: date)

        add = dates.where(exception_type: 1).pluck(:service_id)
        query =
          if add.any?
            where('((start_date <= :date AND end_date >= :date)
                   OR service_id IN (:ids)', date: date, ids: add)
          else
            where('(start_date <= :date AND end_date >= :date)', date: date)
          end

        query = where_day_of_week(query, date)

        rem = dates.where(exception_type: 2).pluck(:service_id)
        if rem.any?
          query.where('(service_id NOT IN (?))', rem)
        else
          query
        end
      end

      private

      # Modifies the given query to only matches the day of the week represented
      # by the given date (format: YYYY-MM-DD)
      def where_day_of_week(query, date_str)
        case Date.new(*date_str.split('-').map(&:to_i)).cwday
        when 1 then query.where(monday:    true)
        when 2 then query.where(tuesday:   true)
        when 3 then query.where(wednesday: true)
        when 4 then query.where(thursday:  true)
        when 5 then query.where(friday:    true)
        when 6 then query.where(saturday:  true)
        else        query.where(sunday:    true)
        end
      end
    end
  end

  DateFormatError = Class.new StandardError
end

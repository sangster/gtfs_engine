module GtfsEngine
  class CalendarDate < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :calendar_dates
  end
end

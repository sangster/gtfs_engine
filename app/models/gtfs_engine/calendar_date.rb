module GtfsEngine
  class CalendarDate < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :calendar_dates
    belongs_to :calendar, inverse_of: :calendar_dates, shared_key: :service_id
  end
end

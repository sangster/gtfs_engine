module GtfsEngine
  class Calendar < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :calendars

    has_many :calendar_dates, inverse_of: :calendar, shared_key: :service_id
    has_many :trips,          inverse_of: :calendar, shared_key: :service_id

    has_many :routes, through: :trips
    has_many :shapes, through: :trips
  end
end

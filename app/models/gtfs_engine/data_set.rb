module GtfsEngine
  class DataSet < ActiveRecord::Base
    has_many :calendars,      inverse_of: :data_set, dependent: :delete_all
    has_many :calendar_dates, inverse_of: :data_set, dependent: :delete_all
    has_many :routes,         inverse_of: :data_set, dependent: :delete_all
    has_many :shapes,         inverse_of: :data_set, dependent: :delete_all
    has_many :stops,          inverse_of: :data_set, dependent: :delete_all
    has_many :stop_times,     inverse_of: :data_set, dependent: :delete_all
    has_many :trips,          inverse_of: :data_set, dependent: :delete_all
  end
end

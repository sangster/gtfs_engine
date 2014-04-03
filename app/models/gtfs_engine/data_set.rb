module GtfsEngine
  class DataSet < ActiveRecord::Base
    with_options inverse_of: :data_set, dependent: :delete_all do |set|
      set.has_many :calendars
      set.has_many :calendar_dates
      set.has_many :routes
      set.has_many :shapes
      set.has_many :stops
      set.has_many :stop_times
      set.has_many :trips
    end
  end
end

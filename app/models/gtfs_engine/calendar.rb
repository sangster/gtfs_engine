module GtfsEngine
  class Calendar < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :calendars
  end
end

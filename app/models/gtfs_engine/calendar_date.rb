# frozen_string_literal: true

module GtfsEngine
  class CalendarDate < ActiveRecord::Base
    belongs_to :data_set, optional: false
    belongs_to :calendar, optional: false,
                          foreign_key: :service_id, primary_key: :service_id
  end
end

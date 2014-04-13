module GtfsEngine
  class DataSet < ActiveRecord::Base
    with_options inverse_of: :data_set, dependent: :delete_all do |set|
      set.has_many :agencies
      set.has_many :calendars
      set.has_many :calendar_dates
      set.has_many :fare_attributes
      set.has_many :fare_rules
      set.has_many :feed_infos
      set.has_many :frequencies
      set.has_many :routes
      set.has_many :shapes
      set.has_many :stops
      set.has_many :stop_times
      set.has_many :transfers
      set.has_many :trips
    end

    scope :newest, -> { order(created_at: :desc).first }

    #@return [Hash] a hash of each record type and the number of records in
    #  this data set
    def record_counts
      Rails.cache.fetch("data_set_counts_#{id}") { count_has_many_records }
    end

    private

    def count_has_many_records
      self.class.reflections.select do |name, assoc|
        assoc.macro == :has_many && assoc.options[:inverse_of] == :data_set
      end.each_with_object({}) do |(name, _), hash|
        hash[name] = send(name).count
      end
    end
  end
end

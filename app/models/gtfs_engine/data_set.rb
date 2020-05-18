# frozen_string_literal: true

module GtfsEngine
  class DataSet < ActiveRecord::Base
    with_options dependent: :delete_all do |set|
      set.has_many(:agencies)
      set.has_many(:calendars)
      set.has_many(:calendar_dates)
      set.has_many(:fare_attributes)
      set.has_many(:fare_rules)
      set.has_many(:feed_infos)
      set.has_many(:frequencies)
      set.has_many(:routes)
      set.has_many(:shapes)
      set.has_many(:stops)
      set.has_many(:stop_times)
      set.has_many(:transfers)
      set.has_many(:trips)
    end

    scope :newest, -> { order(created_at: :desc).first }

    # @return [Hash] a hash of each record type and the number of records in
    #  this data set
    def details
      Rails.cache.fetch("gtfs_data_set_details_#{id}") { create_details }
    end

    def calendars_for_date(date_string)
      Rails.cache.fetch "data[#{id}]_calendars[#{date_string}]" do
        Calendar.from_date_string(date_string).where(data_set_id: id).to_a
      end
    end

    private

    def create_details
      self.class.reflections.select do |_name, assoc|
        assoc.macro == :has_many && assoc.options[:inverse_of] == :data_set
      end.each_with_object({}) do |(name, _), hash|
        controller_class = association_controller_class name
        hash[name] = {
          count: send(name).count,
          filters: controller_class.filters
        }
      end
    end

    def association_controller_class(name)
      mod = self.class.name.deconstantize
      controller = "#{name}_controller".classify
      "#{mod}::#{controller}".constantize
    end

    def association_model_class(name)
      mod = self.class.name.deconstantize
      model = name.to_s.classify
      "#{mod}::#{model}".constantize
    end
  end
end

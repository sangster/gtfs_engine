module GtfsEngine
  class FeedInfo < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :stops

    prefix_aliases :feed, *%i(publisher_name publisher_url lang start_date end_date version)
  end
end

module GtfsEngine
  class Agency < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :agencies

    prefix_aliases :agency, *%i(name url timezone lang fare_url phone)
  end
end

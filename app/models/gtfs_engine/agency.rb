module GtfsEngine
  class Agency < ActiveRecord::Base
    prefix_aliases :agency, *%i(name url timezone lang fare_url phone)
  end
end

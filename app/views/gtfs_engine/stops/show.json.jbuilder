json.ignore_nil! true
json.extract! @stop, *%i(stop_id code name desc lat lon zone_id url
  location_type parent_station timezone wheelchair_boarding)

Rails.application.routes.draw do

  mount GtfsEngine::Engine => "/gtfs_engine"
end

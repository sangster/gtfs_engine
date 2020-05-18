# frozen_string_literal: true

GtfsEngine::Engine.routes.draw do
  with_options only: %i[index show], defaults: { format: :json } do |r|
    r.resources :data_sets, path: '' do
      r.resources :agencies
      r.resources :stops
      r.resources :routes
      r.resources :trips, only: [:show] do
        collection { get 'block/:id', action: :block }
      end
      r.resources :stop_times
      r.resources :calendars do
        collection { get 'for_date/:YYYY_MM_DD', action: :for_date }
        member { get :dates }
      end
      r.resources :calendar_dates
      r.resources :fare_attributes
      r.resources :fare_rules
      r.resources :shapes, only: [:show]
      r.resources :frequencies
      r.resources :transfers, only: [:index] do
        collection do
          get 'from/:stop_id', action: :from
          get 'to/:stop_id', action: :to
          get 'from/:from_id/to/:to_id', action: :from_to
        end
      end
      r.resources :feed_infos, only: [:index]
    end
  end
end

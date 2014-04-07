GtfsEngine::Engine.routes.draw do
  with_options only: [:index, :show], defaults: {format: :json} do |r|

    r.resources :data_sets, path: '' do
      r.resources :agencies
      r.resources :calendars do
        member { get :dates }
      end
      r.resources :calendar_dates
      r.resources :fare_attributes
      r.resources :fare_rules
      r.resources :frequencies
      r.resources :routes
      r.resources :shapes, only: [:show]
      r.resources :stops
      r.resources :stop_times
      r.resources :transfers, only: [:index] do
        collection do
          get 'from/:stop_id', action: :from
          get 'to/:stop_id', action: :to
          get 'from/:from_id/to/:to_id', action: :from_to
        end
      end
      r.resources :trips, only: [:show] do
        collection { get 'block/:id', action: :block }
      end
    end

  end
end

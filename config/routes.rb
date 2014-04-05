GtfsEngine::Engine.routes.draw do
  with_options only: [:index, :show], defaults: {format: :json} do |r|

    r.resources :data_sets, path: '' do
      r.resources :agencies
      r.resources :calendars do
        member { get :dates }
      end
      r.resources :routes
      r.resources :stops
    end

  end
end

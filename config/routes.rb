GtfsEngine::Engine.routes.draw do
  with_options only: [:index, :show], defaults: {format: :json} do |r|
    r.resources :data_sets, path: '' do
      r.resources :stops
      r.resources :agencies
    end
  end
end

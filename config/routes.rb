GtfsEngine::Engine.routes.draw do
  resources :stops, only: [:index, :show]
end

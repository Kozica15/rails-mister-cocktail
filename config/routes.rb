
Rails.application.routes.draw do
  resources :cocktails, only: [ :new, :show, :index, :create] do
    resources :doses, only: [:create]
  end

  resources :doses, only: [:destroy]

  resources :ingredients, only: [:show]
# racine de la route
  root "cocktails#index"
end



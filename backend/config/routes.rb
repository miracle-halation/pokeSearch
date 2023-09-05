Rails.application.routes.draw do
  namespace :v1 do
    resources :pokemon, only: [:index, :show, :create, :update, :destroy]
  end
end

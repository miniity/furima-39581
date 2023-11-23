Rails.application.routes.draw do
  devise_for :users
  resources :items, only:  [:index, :new, :create, :destroy, :edit, :show]
  root to: "items#index"
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:new, :create, :show] do
    get :all_boards, on: :collection
  end
  root to: 'games#index'
end

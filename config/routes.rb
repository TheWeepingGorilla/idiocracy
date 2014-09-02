Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, :except => [:index, :edit, :show]
  resources :users, :except => [:index, :edit, :show] do
    resources :questions, only: :new
  end


  root :to => 'questions#index'
  resources :questions do
    resources :responses do
      resources :votes
    end
  end

end

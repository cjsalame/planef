Rails.application.routes.draw do
  root 'home#index'
  # root 'users#current_user_show'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users do
    resources :schools
  end
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

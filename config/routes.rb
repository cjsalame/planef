Rails.application.routes.draw do
  root 'home#index'
  # root 'users#current_user_show'
  devise_for :users, controllers: { registrations: 'registrations' }
  post '/users/:id' => 'users#subscribeschool', as: 'sub_school'
  delete '/users/:id' => 'users#unsubschool', as: 'unsub_school'


  resources :users do
    resources :schools
  end

  resources :schools do
    resources :users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

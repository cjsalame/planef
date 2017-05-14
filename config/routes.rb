Rails.application.routes.draw do
  root 'home#index'
  # root 'users#current_user_show'
  devise_for :users, controllers: { registrations: 'registrations' }

  # post 'users/:id/subscribe_subject', :to => 'users#subscribe_subject'
  post 'users/:id' => 'users#subscribe_subject', as: 'sub_subject'
  post '/users/:id' => 'users#subscribe_school', as: 'sub_school'
  delete '/users/:id' => 'users#unsubschool', as: 'unsub_school'
  resources :users do
    #member do
    #  post 'sub_subject'
    #end
    resources :schools
    resources :subjects_teachers
  end
  resources :subjects_teachers


  resources :schools do
    resources :users
    resources :subjects
  end

  resources :subjects

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

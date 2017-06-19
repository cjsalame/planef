Rails.application.routes.draw do
  root 'home#index'
  # root 'users#current_user_show'
  devise_for :users, controllers: { registrations: 'registrations' }
  # post 'users/:id/subscribe_subject', :to => 'users#subscribe_subject'
  # post 'users/:id' => 'users#subscribe_subject', as: 'sub_subject'
  post '/users/:id' => 'users#subscribe_school', as: 'sub_school'
  delete '/users/:id' => 'users#unsubschool', as: 'unsub_school'
  get '/users/:id/schools' => 'users#schools', as: :users_schools
  resources :users do
    resources :schools
    resources :subjects_teachers
    resources :subjects
    resources :grades_subjects_teachers
  end
  resources :subjects_teachers do
    resources :users
  end
  resources :grades_subjects_teachers
  resources :searches
  resources :schools do
    resources :users
    resources :subjects
  end

  resources :subjects do
    resources :subjects_teachers
    resources :users
  end
  resources :grades

  resources :planifications do
    resources :lectures
    get :add_lecture, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "questions#index"

  resources :questions do
    resources :answers
  end

  get '/user_question', to: 'questions#user_question'
  get '/user_answer', to: 'answers#show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

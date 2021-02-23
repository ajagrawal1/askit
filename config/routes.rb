Rails.application.routes.draw do
  root "questions#index"

  resources :questions do
    resources :answers
  end

  get '/user_question', to: 'questions#user_question'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

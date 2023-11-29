Rails.application.routes.draw do
  resources :blogs
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end

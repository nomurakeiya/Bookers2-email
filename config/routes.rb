Rails.application.routes.draw do

	devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users,only: [:show,:edit,:update,:index, :create]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  root 'home#top'
  get 'home/about'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

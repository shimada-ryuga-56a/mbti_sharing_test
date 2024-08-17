Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'staticpages#top'
  get 'top', to: 'users#index'
  get 'mypage', to: 'users#mypage'
  resources :users, only: %i[show]
end
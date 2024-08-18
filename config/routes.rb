Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, :only => [:index]
  root 'staticpages#top'
  get 'mypage', to: 'users#mypage'
  resources :users, only: %i[show edit]
end
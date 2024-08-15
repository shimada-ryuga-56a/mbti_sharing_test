Rails.application.routes.draw do
  devise_for :users
  root 'staticpages#top'
  get 'top', to: 'users#index'
end
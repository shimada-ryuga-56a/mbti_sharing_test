Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: %i[show edit index] do
    resource :relationships, only: [:create, :destroy]
  	get "followings", to: "relationships#followings", as: "followings"
  	get "followers", to: "relationships#followers", as: "followers"
  end

  root 'staticpages#top'
  get 'mypage', to: 'users#mypage'
end
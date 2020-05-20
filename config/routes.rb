Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
}

  # ネストされたrouting
  resources :posts do
  resources :comments, only: [:create,:destroy]
  end
  
  root "posts#index"

end

Rails.application.routes.draw do
  root "home#top"

  get 'signin' => "users#signin_form"
  post 'signin' => "users#signin"
  get 'signup' => "users#signup_form"
  post 'signup' => "users#signup"
  post 'signout' => "users#signout"

  get 'search' => "search#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

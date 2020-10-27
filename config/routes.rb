Rails.application.routes.draw do
  root "home#top"

  get 'signin' => "users#signin_form"
  post 'signin' => "users#signin"
  get 'signup' => "users#signup_form"
  post 'signup' => "users#signup"
  post 'signout' => "users#signout"

  get 'account' => "users#show"
  get 'account/update_name' => "users#show"
  post 'account/update_name' => "users#update_name"
  get 'account/update_email' => "users#show"
  post 'account/update_email' => "users#update_email"
  get 'account/update_password' => "users#show"
  post 'account/update_password' => "users#update_password"

  get 'adminmng/top' => "users#top"
  get 'adminmng/users/index' => "users#index"
  get 'adminmng/users/:user_id/grant' => "users#grant_form"
  post 'adminmng/users/:user_id/grant' => "users#grant"
  get 'adminmng/users/:user_id/destroy' => "users#destroy_form"
  post 'adminmng/users/:user_id/destroy' => "users#destroy"

  get 'search' => "search#top"
  get 'search/search_results' => "search#index"
  get 'search/:noun' => "search#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

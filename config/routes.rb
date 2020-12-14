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

  get 'adminmng/top' => "admin#top"
  get 'adminmng/users/index' => "admin#index"
  get 'adminmng/users/:user_id/grant' => "admin#grant_form"
  post 'adminmng/users/:user_id/grant' => "admin#grant"
  get 'adminmng/users/:user_id/destroy' => "admin#destroy_form"
  post 'adminmng/users/:user_id/destroy' => "admin#destroy"

  get 'search' => "search#top"
  get 'search/search_results' => "search#index"
  get 'search/new' => "search#new"
  post 'search/new' => "search#create"
  get 'search/:noun' => "search#show"
  get 'search/:noun/edit' => "search#edit"
  post 'search/:noun/destroy' => "search#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

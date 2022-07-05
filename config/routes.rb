Rails.application.routes.draw do

  post "/users" => "users#create"
  get "/users" => "users#show"
  patch "/users" => "users#update"
  delete "/users" => "users#destroy"  

  post "/sessions" => "sessions#create"



  get "/baskets" => "baskets#index"
  get "/baskets/:id" => "baskets#show"
  post "/baskets" => "baskets#create"
  patch "/baskets/:id" => "baskets#update"
  delete "/baskets/:id" => "baskets#destroy"

  get "/asset_baskets" => "asset_baskets#index"

  get "/assets" => "assets#index"
  get "/assets/:id" => "assets#show"


  
end


Rails.application.routes.draw do
  post "user_token" => "user_token#create"
  
  namespace :v1 do
    post "/users" => "users#create"
    get "/products" => "products#index"
    post "/products" => "products#create"
    post "/orders" => "orders#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end
end

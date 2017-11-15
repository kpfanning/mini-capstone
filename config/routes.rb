Rails.application.routes.draw do
  get "/product_url" => "products#product_method"
  get "/product_first_url" => "products#product_first_method"
end

Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/edit_profile" => "users#edit", as: "edit"
  post "/profile" => "users#update"
  post "/sales/:id" => "sales#search_product", as: "search_sale"
  post "/deliveries/new" => "deliveries#search_product", as: "search_delivery"
  # get '/edit' => 'sales#search_product', :as => 'search_sale'  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "users#home";
  resources :users
  resources :products
  resources :sales
  resources :deliveries
end
 
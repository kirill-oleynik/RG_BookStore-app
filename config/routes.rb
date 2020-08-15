Rails.application.routes.draw do
  with_options only: [:create,:update,:destroy] do |admin_only|
    admin_only.resources :authors
  end
    namespace :api, path: '/', constraints: {subdomain: 'api'} do
  with_options only: [:index,:show] do |list_only|
    list_only.resources :authors
  end
    end
end

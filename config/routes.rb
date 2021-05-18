Rails.application.routes.draw do



  scope "(:locale)", locale: /en|fr/ do
    root :to => 'shops#index'
    resources :shops
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

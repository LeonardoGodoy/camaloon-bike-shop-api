Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope :api, module: :api do
    scope :v1, module: :v1 do
      resources :categories, only: %i(index show create)
      resources :products, only: %i(index show create)
    end
  end
end

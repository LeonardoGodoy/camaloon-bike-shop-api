Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope :api, module: :api do
    scope :v1, module: :v1 do
      scope :admin, module: :admin do
        resources :categories, only: %i(index show create)
        resources :products, only: %i(index show create) do
          resources :product_versions, only: %i(index) do
            post '/enable', to: 'product_versions#enable'
            post '/disable', to: 'product_versions#disable'
          end
        end
      end

      resources :products, only: %i(index show)
    end
  end
end

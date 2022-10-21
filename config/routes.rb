Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'fibonacci', to: "fibonacci#index"
      post 'fibonacci', to: "fibonacci#create"
    end
  end
end

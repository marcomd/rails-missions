Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'fibonacci', to: "fibonacci#create"
    end
  end
end

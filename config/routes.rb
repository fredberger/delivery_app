Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pdvs, only: [:create, :show] do
    collection do
      get :search
    end
  end
end

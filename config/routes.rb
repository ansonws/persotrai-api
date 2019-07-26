Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :trainers do
        resources :reviews, only: [:create, :destroy]
        resources :favourites, only: [:create, :destroy]
        member do 
          get :trainer_dashboard
        end
      end
      resource :session, only: [:create, :destroy]
      resources :users do
        get :current, on: :collection
        member do 
          get :change_password
          patch :update_password
          get :dashboard
        end
      end
      resources :lessons,only:[:create, :destroy, :show, :edit, :update] do
        member do
          put :request
          put :approve
          put :decline
          put :pay
          put :finish
          put :done
        end
    end
  end
end

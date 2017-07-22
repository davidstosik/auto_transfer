Rails.application.routes.draw do
  resources :transfers, only: [] do
    member do
      get :execute
    end
  end
end

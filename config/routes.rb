Rails.application.routes.draw do
  resources :reports do
    member do
      get :csv
    end
    resources :report_items
  end

  root 'reports#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

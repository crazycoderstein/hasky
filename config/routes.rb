Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'questions#index'
    get 'session/login'
    post 'session/create'
    get 'session/logout'
    get 'users/new'
    
    resources :questions
    resources :users, only: [:create, :update, :edit]
    resources :questions do 
      resources :answers, only: [:create, :destroy] 
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

get('/', {to: 'welcome#index', as: :home})

resources :records
resources :users, only: [:new, :create]
resource :session, only: [:new, :create, :destroy]

end

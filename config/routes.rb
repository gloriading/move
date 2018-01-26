Rails.application.routes.draw do

  resources :meetings
get('/', {to: 'welcome#index', as: :home})
get('/about', {to: 'about#index', as: :about})

resources :records
resources :users, only: [:new, :create]
resource :session, only: [:new, :create, :destroy]

end

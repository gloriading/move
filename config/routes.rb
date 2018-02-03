
Rails.application.routes.draw do

resources :meetings
get('/', {to: 'welcome#index', as: :home})
get('/about', {to: 'about#index', as: :about})

resources :records
resources :users, only: [:new, :create, :show]
resource :session, only: [:new, :create, :destroy]

get('/screens', {to: 'screens#index', as: :screenshot})
end

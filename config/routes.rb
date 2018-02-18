
Rails.application.routes.draw do

namespace :api, defaults: { format: :json } do
  namespace :v1 do
    resources :charts, only: [:index]
    resources :records, only: [:index]
    resources :shares
  end
end

resources :meetings
get('/', {to: 'welcome#index', as: :home})
get('/about', {to: 'about#index', as: :about})

resources :records
resources :users, only: [:new, :create, :show]
resources :shares do
  collection do
    get 'public'
  end
  resources :publishings, only: [:create]
  resources :recyclings, only: [:create]
  resources :likes, only: [:create, :destroy], shallow: true
end

resource :session, only: [:new, :create, :destroy]

get('/screens', {to: 'screens#index', as: :screenshot})

end

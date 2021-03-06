Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"

  get '/', to: 'cocktails#index'

  resources :cocktails, only: [ :index, :show, :new, :create] do
    resources :doses, only: :create
  end
  resources :doses, only: [:destroy, :edit, :update]
end

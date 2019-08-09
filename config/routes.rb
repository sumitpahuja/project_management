Rails.application.routes.draw do
  devise_for :users
  as :user do
    get '/' => 'devise/registrations#new'
  end  

  resources :projects do
    member do 
      get :manage_team
    end
    # collection do
    # end
  end    

  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do


  root to: 'tasks#index'
  devise_for :users
  as :user do
    get '/' => 'devise/registrations#new'
  end  

  resources :projects do
    member do 
      get :manage_team
      get :assign_tasks
    end
    collection do
      get :projects_status
    end
  end    

  resources :tasks do
    collection do
      get :developers_task_status
      get :projects_tasks_status
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

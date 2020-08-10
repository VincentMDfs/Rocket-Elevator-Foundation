Rails.application.routes.draw do
  
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "/blazer"
  end
root "main#index"

get "main/index"
get 'main/residential_projects'
get 'main/commercial_projects'
get 'main/quote'
get 'main/404'
post 'main', to: "main#banane"
post 'contactToLead', to: "main#contactToLead"
get 'fileLeads/:id', to: 'main#download'
get '*path' => redirect('/main/404')

end

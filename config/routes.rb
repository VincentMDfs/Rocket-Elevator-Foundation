Rails.application.routes.draw do
  
  
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "/blazer"
  end
  authenticated :user, ->(user) { user.admin? } do
    get 'intervention', to: "intervention#intervention"
  end
root "main#index"

get 'customer', to: 'intervention#get_customers'
get 'get_buildings_by_customer/:buildings_id', to: 'intervention#get_buildings_by_customer'
get 'get_batteries_by_building/:battery_id', to: 'intervention#get_batteries_by_building'
get 'get_columns_by_battery/:column_id', to: 'intervention#get_columns_by_battery'
get 'get_elevators_by_column/:elevator_id', to: 'intervention#get_elevators_by_column'
get 'employee', to: 'intervention#get_employees'

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

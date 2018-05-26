Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  get 'schools/index'
  get 'schools/show'
  get 'years/show'
  get 'years/index'
  root 'users#index'
  get '/increase_years/:year' => 'students#increase_student_year', as: :increase_years
  resources :years
  resources :users
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :schools
end

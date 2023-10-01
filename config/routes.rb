Rails.application.routes.draw do
  # devise_for :users
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "application#index"
  namespace 'api' do
    resource 'authentication', only: [] do
      post 'login'
    end
    resources :notes
  end

end

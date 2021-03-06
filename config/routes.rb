Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'

  namespace 'api' do
    namespace 'v1' do
      resources :users, only: %i[show create]

      resources :projects do
        resources :tasks, shallow: true
      end
    end
  end
end

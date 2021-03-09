Rails.application.routes.draw do
  get 'books/index'
  namespace :api do
    namespace :v1 do
      resources :problems do
        collection do
          get :questions
          post :analyze
        end
      end
      resources :categories
      resources :books
      resources :formats
    end
  end
end

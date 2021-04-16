Rails.application.routes.draw do
  get 'books/index'
  namespace :api do
    namespace :v1 do
      resources :problems do
        collection do
          get :questions
          get :today_questions
          post :analyze
        end
      end
      resources :categories do
        collection do
          post :update_recursive
        end
      end
      resources :books
      resources :formats
    end
  end
end
